I#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xil_io.h"
#include "xbasic_types.h"
#include "xparameters.h"
#include "xiicps.h"
#include "xgpiops.h"
#include "xspips.h"		/* SPI device driver */
#include <math.h>

//I2C config params
#define IIC_DEVICE_ID XPAR_XIICPS_0_DEVICE_ID
#define IIC_SCLK_RATE 100000
#define PAGE_SIZE 16
// camera I2C addresses
#define CAM1_ADDR 0x48
#define CAM2_ADDR 0x58
// camera I2C write addresses
#define REG_LOCK 0xFE
#define CAMERA_CTL 0x07
// camera I2C write values
#define MANUAL_TRIG 0x0198
#define LOCKED 0xDEAD
#define UNLOCKED 0xBEEF
// I2C address size
typedef u8 AddressType;

// Zynq SPI device ID
#define SPI_DEVICE_ID		XPAR_XSPIPS_0_DEVICE_ID
// SPI addresses to read to / write from
#define READ 0x80 /*OR*/
#define WRITE 0x7F /*AND*/
#define CTL1 0x20
#define CTL2 0x21
#define CTL3 0x22
#define STATUS_ADDRESS 0x27
#define DATA_ADDRESS 0x28
#define OFFSET_ADDRESS_XLOW 0x05
#define OFFSET_ADDRESS_XHIGH 0x06
#define OFFSET_ADDRESS_YLOW 0x07
#define OFFSET_ADDRESS_YHIGH 0x08
#define CASCADE 0x60

#define PI 3.14159265
#define DEGREES_PER_STEP 0.3515625	// 360 degrees/1024 steps = 0.3515625
#define MAGNETOMETER_SENSITIVITY 0.00014	// +/- 4 gauss

// create a new SPI instance
static XSpiPs SpiInstance;
// create a new GPIO instance
static XGpioPs Gpio;
static XIicPs IicInstance;		/* The instance of the IIC device. */

int xOffset, yOffset;
int xData, yData;

typedef enum
{
	WAIT = 0,
	TX_COMMAND = 1,
	RX_DATA = 2
}UART_STATE;

// function prototype for camera initialization fxn
void init_cams();

void delay(int cycles);
void IMU_init();
int getIMUdata();
double getCompassHeading();
double getStepOffset(double compassHeading);

int main()
{
    init_platform();

    char echo[11];
    char status[2];
    char databuf[65][24];
    char databufbuf[3];
    char linefeed[4];

    echo[10] = '\0';
    databufbuf[2] = '\0';

    Xuint32 *baseaddr_p = (Xuint32 *)XPAR_CUSTOM_LOGIC_S00_AXI_BASEADDR;

    u32 data_enable_step;
    u32 write;
	u32 stepbuf;

	char *echotestnl = "G00076801\n";
	char *echotestlf = "G00076801\r";

    UART_STATE STATE = WAIT;

    // setup LED output
    XGpioPs_Config * ConfigPtr = XGpioPs_LookupConfig(XPAR_PS7_GPIO_0_DEVICE_ID);
    XGpioPs_CfgInitialize(&Gpio, ConfigPtr, ConfigPtr->BaseAddr);
    XGpioPs_SetDirectionPin(&Gpio, 7, 1);
    // initialize cameras using I2C
    init_cams();

    int Status;
    // initialize SPI
   	XSpiPs_Config *SpiConfig;
   	SpiConfig = XSpiPs_LookupConfig(SPI_DEVICE_ID);
   	// initialize the spi hardware with the device config
    Status = XSpiPs_CfgInitialize(&SpiInstance, SpiConfig, SpiConfig->BaseAddress);
   	// Set the Spi device as a master
   	XSpiPs_SetOptions(&SpiInstance, XSPIPS_MASTER_OPTION | XSPIPS_CLK_PHASE_1_OPTION | XSPIPS_FORCE_SSELECT_OPTION);
    // Set the SPI clock prescaler
    XSpiPs_SetClkPrescaler(&SpiInstance, XSPIPS_CLK_PRESCALE_256);
    // initialize the imu
	IMU_init();

    int deviceStepOffset = 0;


    // Continuously run rangefinder state machine after initialization is complete
    while(1)
    {
		switch(STATE)
		{
			// Wait until the PL indicates that it wants new rangefinder data
			case WAIT:
			{
				//blocks until the flag is set (from PL) to initiate data transfer
				while(Xil_In32(baseaddr_p) == 0);
                while(getIMUdata()==0);
				deviceStepOffset = (int) round(getStepOffset(getCompassHeading()));

				STATE = TX_COMMAND;
				break;
			}
			// Call to the rangedfinder for a new round of data acquisition
			case TX_COMMAND:
			{
				printf("G00076801\n"); // data acquisition command
				STATE = RX_DATA;
				break;
			}
			// Process incoming data from the rangefinder byte by byte
			case RX_DATA:
			{
				int rx_index = 0;	// indexes rows
				int rx_line = 0;	// indexes columns - counts which data line is being received

				// receives echo
				for(rx_index = 0; rx_index < 10; rx_index++)
				{
					echo[rx_index] = inbyte();	// blocking - inbyte is polled
				}

				// makes sure the echo command is successful
				// if not, it repeats the tx_command state
				if(strcmp(echo, echotestnl) != 0 && strcmp(echo, echotestlf) != 0)
				{
					STATE = WAIT;
					break;
				}

				// receives status
				for(rx_index = 0; rx_index < 2; rx_index++)
				{
					status[rx_index] = inbyte();	// blocking - inbyte is polled
				}

				int iteration = 0;

				// receives 24 data blocks
				stepbuf = deviceStepOffset; //deviceStepOffset;
				for(rx_line = 0; rx_line < 24; rx_line++)
				{
					iteration = 0;
					// receives 65 bytes per block
					for(rx_index = 0; rx_index < 65; rx_index++)
					{
						iteration++;
						databuf[rx_line][rx_index] = inbyte();	// blocking - inbyte is polled
						write = 0;
						databufbuf[1-(iteration%2)] = databuf[rx_line][rx_index];

						// process data two chars at a time
						if(iteration%2 == 0)
						{
							//'enables' data in memory when the data is not an error code
							if(!(strcmp(databufbuf[0], '0') == 0 && strcmp(databufbuf[1], 'C') <= 0))
								write = 1;
							stepbuf++;
						}

						//sends information to the programmable logic for each data point (2 chars)
						//in the order of {data, enable, step}
						//data_enable_step = (400 << 20) | (400 << 12) | (write << 11) | stepbuf;
						data_enable_step = (databufbuf[1] << 20) | (databufbuf[0] << 12) | (write << 11) | stepbuf;
						*(baseaddr_p+1) = data_enable_step;

					}
				}

				iteration = 0;
				// account for 4 chars of data after step data has been sent
				for(rx_index = 0; rx_index < 4; rx_index++)
				{
					linefeed[rx_index] = inbyte();	// blocking - inbyte is polled
				}

				echo[0] = '\0';

				STATE = WAIT;
				break;
			}
		}
    }
    cleanup_platform();
    return 0;
}

void init_cams()
{
    // number of bytes to be written from write buffer
    u8 ByteCount = 4;
    // Create and fill write buffer with ByteCount bytes of data
    u8 WriteBuffer[sizeof(AddressType) + PAGE_SIZE];
    WriteBuffer[0] = (u8) (CAM1_ADDR); // camera 1 I2C address
    WriteBuffer[1] = (u8) (CAMERA_CTL); // camera control register
    WriteBuffer[2] = (u8) (MANUAL_TRIG >> 8); // 16 bit write value (upper byte)
    WriteBuffer[3] = (u8) (MANUAL_TRIG); // 16 bit write value (lower byte)

    XIicPs_Config *ConfigPtr;
    int Status;

    // Look up Zynq-specific IIC device configuration
    ConfigPtr = XIicPs_LookupConfig(IIC_DEVICE_ID);
    // Initialize said device-specific iic configuration so the driver is ready for use
    Status = XIicPs_CfgInitialize(&IicInstance, ConfigPtr, ConfigPtr->BaseAddress);
    // Run a self test to make sure the driver works (will return XST_SUCCESS if working)
    Status = XIicPs_SelfTest(&IicInstance);
    // Set iic SCLK rate (bus now ready for use)
    XIicPs_SetSClk(&IicInstance, IIC_SCLK_RATE);

    // Initialize Cam1
    XIicPs_MasterSendPolled(&IicInstance, WriteBuffer, ByteCount,CAM1_ADDR);
    while(XIicPs_BusIsBusy(&IicInstance));

    // Initialize Cam2
    WriteBuffer[0] = (u8) (CAM2_ADDR); // change write address to cam2
    XIicPs_MasterSendPolled(&IicInstance, WriteBuffer, ByteCount,CAM2_ADDR);
    while(XIicPs_BusIsBusy(&IicInstance));

    // Write LED to indicate finished initialization sequence
    XGpioPs_WritePin(&Gpio, 7, 0x01);
}

void delay(int cycles)
{
	int i = 0;
	while(i<cycles)
		i++;
	return;
}

void IMU_init()
{
	u8 DataBuffer[2]; // addr + 8 bits write val
	// high power mode
	DataBuffer[0] = (u8) CTL1 & WRITE;
	DataBuffer[1] = (u8) 0x7C;
	// ONLY SET SLAVE SELECT ON THE 1ST TRANSFER
	XSpiPs_SetSlaveSelect(&SpiInstance,0x01);
	XSpiPs_PolledTransfer(&SpiInstance, DataBuffer, NULL, 2);
	delay(500);

	DataBuffer[0] = (u8) CTL2 & WRITE;
	DataBuffer[1] = (u8) 0x00;
	XSpiPs_PolledTransfer(&SpiInstance, DataBuffer, NULL, 2);
	delay(500);

	// turn on the device
	DataBuffer[0] = (u8) CTL3 & WRITE;
	DataBuffer[1] = (u8) 0x80;
	XSpiPs_PolledTransfer(&SpiInstance, DataBuffer, NULL, 2);
	delay(250);

	return;
}

int getIMUdata()
{

	int newDataReady = 0;

	// check status address
	u8 DataBuffer[2]; // addr + 8 bits read val
	DataBuffer[0] = (u8) STATUS_ADDRESS | READ;
	DataBuffer[1] = (u8) 0x00;
	XSpiPs_PolledTransfer(&SpiInstance, DataBuffer, &DataBuffer[0], 2);

	// if XY data's available, indicate so and grab it
	if ((DataBuffer[1] & 0x03) == 0x03) {

		// grabs x and y magnetometer environmental offset
		u8 XYoffset[5];
		XYoffset[0] = (u8) OFFSET_ADDRESS_XLOW | CASCADE | READ;
		XYoffset[1] = (u8) 0x00;
		XYoffset[2] = (u8) 0x00;
		XYoffset[3] = (u8) 0x00;
		XYoffset[4] = (u8) 0x00;
		XSpiPs_PolledTransfer(&SpiInstance, XYoffset, &XYoffset[0], 5);
		xOffset = (XYoffset[2]<<8) | XYoffset[1];
	    yOffset = (XYoffset[4]<<8) | XYoffset[3];

	    // grabs x and y magnetometer data
		u8 XYdata[5];
		XYdata[0] = (u8) DATA_ADDRESS | CASCADE | READ;
		XYdata[1] = (u8) 0x00;
		XYdata[2] = (u8) 0x00;
		XYdata[3] = (u8) 0x00;
		XYdata[4] = (u8) 0x00;
		XSpiPs_PolledTransfer(&SpiInstance, XYdata, &XYdata[0], 5);
		xData = (XYdata[2]<<8) | XYdata[1];
		yData = (XYdata[4]<<8) | XYdata[3];


		if(XYdata[2] >= 0x80)
			xData = (xData - 65535) + 1;
		if(XYdata[4] >= 0x80)
			yData = (yData - 65535) + 1;

	    newDataReady = 1;
	}

	return newDataReady;
}

// translates magnetometer data into a compass heading
double getCompassHeading()
{
	//subtracts the environmental interference from the data
//	int xMagnetometer = xData - xOffset;
//	int yMagnetometer = yData - yOffset;

	//compass heading in degrees
	double compassHeading = atan2((double)yData, (double)xData) * (double)(180/PI);

	return compassHeading;
}

// converts compass heading to a step offset from north for rangefinder data
double getStepOffset(double compassHeading)
{
    if(compassHeading < 0)
        compassHeading = 360 + compassHeading;

	double stepOffset = compassHeading / DEGREES_PER_STEP;

	return stepOffset;
}
