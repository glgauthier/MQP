/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

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

typedef enum
{
//	WAIT = 0,
	TX_COMMAND = 1,
	RX_DATA = 2,
//	POLL_SEND = 3,	// for debug purposes only
}UART_STATE;

int main()
{
    init_platform();

    char echo[10];
    char status[5];
    char databuf[65][24];
    char databufbuf[2];
    char linefeed[3];

    u32 write;
	u32 stepbuf;

    UART_STATE STATE = TX_COMMAND;

    while(1)
    {
		switch(STATE)
		{
//			case WAIT:
//			{
//				if(Xil_In32(0x43C00000) == 1)
//				{
//					STATE = TX_COMMAND;
//				}
//				break;
//			}

			case TX_COMMAND:
			{
				print("G00076801\n");
				STATE = RX_DATA;
				break;
			}

			case RX_DATA:
			{
				int rx_index = 0;	// indexes across arrays
				int rx_line = 0;	// counts which data line is being received

				// receives echo
				for(rx_index = 0; rx_index < 10; rx_index++)
				{
					echo[rx_index] = inbyte();	// blocking - inbyte is polled
				}

				// makes sure the echo command is successful
				// if not, it repeats the tx_command state
				char *echotest = "G00076801\n";
				if(strcmp((char*)echo, echotest) != 0)
				{
					STATE = TX_COMMAND;
					break;
				}

				// receives status
				for(rx_index = 0; rx_index < 5; rx_index++)
				{
					status[rx_index] = inbyte();	// blocking - inbyte is polled
				}

				int iteration = 0;

				// receives 24 data blocks
				stepbuf = 0;
				for(rx_line = 0; rx_line < 24; rx_line++)
				{
					iteration = 0;

					for(rx_index = 0; rx_index < 65; rx_index++)
					{
						iteration++;

						databuf[rx_index][rx_line] = inbyte();	// blocking - inbyte is polled

						write = 0;

						databufbuf[1-(iteration%2)] = databuf[rx_index][rx_line];

						if(iteration%2 == 0)
						{
							write = 1;
							stepbuf++;

							//sends information to the programmable logic for each data point (2 chars)
							//in the order of {data, enable, step}
							Xil_Out32(0x34C00008, ((*databufbuf << 12) + (write << 11) + (stepbuf)));
						}
					}
				}

				iteration = 0;

				for(rx_index = 0; rx_index < 3; rx_index++)
				{
					linefeed[rx_index] = inbyte();	// blocking - inbyte is polled
				}

				echo[0] = '\0';

				STATE = TX_COMMAND;
				break;
			}


		}
    }
    cleanup_platform();
    return 0;
}
