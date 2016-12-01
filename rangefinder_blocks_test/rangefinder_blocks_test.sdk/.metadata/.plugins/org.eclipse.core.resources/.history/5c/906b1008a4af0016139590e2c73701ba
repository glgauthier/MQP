/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xil_io.h"
#include "xbasic_types.h"
#include "xparameters.h"

typedef enum
{
	WAIT = 0,
	TX_COMMAND = 1,
	RX_DATA = 2
}UART_STATE;

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

    Xuint32 *baseaddr_p = (Xuint32 *)XPAR_NU_NU_RANGEFINDER_VGA_0_S00_AXI_BASEADDR;

    u32 data_enable_step;
    u32 write;
	u32 stepbuf;

//	int first = 1;

	char *echotestnl = "G00076801\n";
	char *echotestlf = "G00076801\r";

    UART_STATE STATE = WAIT;

    while(1)
    {
		switch(STATE)
		{
			case WAIT:
			{
				//blocks until the flag is set (from PL) to initiate data transfer
				while(Xil_In32(baseaddr_p) == 0);
//				if(!first)
//				{
//					while(1)
//						printf("%c\n", inbyte());
//				}
//				first = 0;
				STATE = TX_COMMAND;
				break;
			}

			case TX_COMMAND:
			{
//////////////////clear inbyte buffer before this line so that the next line read in is accurate
				printf("G00076801\n");
				STATE = RX_DATA;
				break;
			}

			case RX_DATA:
			{
				int rx_index = 0;	// indexes rows
				int rx_line = 0;	// indexes columns - counts which data line is being received

				// receives echo
				for(rx_index = 0; rx_index < 10; rx_index++)
				{
					echo[rx_index] = inbyte();	// blocking - inbyte is polled
//					printf("receives char %c \n", echo[rx_index]);
				}

				// makes sure the echo command is successful
				// if not, it repeats the tx_command state

				if(strcmp(echo, echotestnl) != 0 && strcmp(echo, echotestlf) != 0)
				{
//					printf("echo did not match\n");
					STATE = WAIT;
					break;
				}

				// receives status
				for(rx_index = 0; rx_index < 2; rx_index++)
				{
					status[rx_index] = inbyte();	// blocking - inbyte is polled
				}

				//
//				if(strcmp(status[0], '0') != 0)
//				{
//					STATE = WAIT;
//					break;
//				}

//				printf("receiving data blocks\n");

				int iteration = 0;

				// receives 24 data blocks
				stepbuf = 0;
				for(rx_line = 0; rx_line < 24; rx_line++)
				{
					iteration = 0;

					for(rx_index = 0; rx_index < 65; rx_index++)
					{
						iteration++;
						databuf[rx_line][rx_index] = inbyte();	// blocking - inbyte is polled
						write = 0;
						databufbuf[1-(iteration%2)] = databuf[rx_line][rx_index];

						if(iteration%2 == 0)
						{
							//'enables' data in memory when the data is not an error code
							if(!(strcmp(databufbuf[0], '0') == 0 && strcmp(databufbuf[1], 'C') <= 0))
								write = 1;
							stepbuf++;
						}

						//sends information to the programmable logic for each data point (2 chars)
						//in the order of {data, enable, step}
						data_enable_step = (databufbuf[1] << 20) + (databufbuf[0] << 12) + (write << 11) + stepbuf;
//						printf("about to write %c %c %d %d to mem\n", databufbuf[0], databufbuf[1], write, stepbuf);
						*(baseaddr_p+1) = data_enable_step;
					}
				}

				iteration = 0;

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
