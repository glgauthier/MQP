`timescale 1ns / 1ps

module IMU_top(
    input button, // 16kHz clock pulse (16kHz*16 writes = 1mS period)
    input fpga_clk, // 4MHz clock for creating sclk
    input reset, // asynchronous reset
    output sclk,
    output reg mosi,
    output cs_nAG,
    output cs_nALT,
    output reg cs_nM,
    input miso,
    output [7:0] led
    );
    
    assign cs_nALT = 1'b1;
    assign cs_nAG = 1'b1;
    
    wire clk_10M;
    
    wire clk_100M;
    reg [15:0] transferVal;
    reg [31:0] inVal;
    
    reg [6:0] time_counter;
    reg [6:0] time_buf;
   
    // regs/params for state machine control
    parameter [1:0] s0 = 0, s1 = 1, s2 = 2;
    reg [1:0] current_state, next_state;
     
    reg [5:0] bitsOut;
    reg [2:0] bitsIn; // SPI bit transfer counter (0-7)
    reg [4:0] Count;
    reg [7:0] SPI_counter;
    
    // write enable signal, triggered by counter
    wire en;
    assign en = (SPI_counter == 8'hFF);
    
    //waits 8 clock cycles between SPI transfers
    always @ (posedge clk_10M, posedge reset)
    begin
        if(reset || !cs_nM)
            SPI_counter <= 8'h00;
        else
            SPI_counter <= SPI_counter + 1'b1;
    end
    
    // State machine overhead control
    always @ (negedge clk_10M, posedge reset)
        if (reset)
            current_state <= s0;
        else if (en)
            current_state <= s1;
        else
            current_state <= next_state;
    
    reg ctrl_reg3_n, status_reg, get_magn_data, get_magn_offset;
    
    // Change next_state based on the SPI write sequence
    always @ (current_state, bitsOut, transferVal, get_magn_data, en)
    begin
        case (current_state)
            // The state machine will remain in s0 until a new en pulse
            s0:
                if(en)
                    next_state = s1;
                else
                    next_state = s0;
                    
            // The state machine will remain in s1 for the entirety of an SPI transfer
            s1:
                if ((get_magn_data && bitsOut == 39) || (!get_magn_data && bitsOut == 15))
                    next_state = s2;
                else
                    next_state = s1;
                    
            s2:
                next_state = s0;
                    
            default:
                next_state = s0;
        endcase
    end
    
    reg independence;  // declaration of independence
    
    always @ (posedge clk_10M)
    begin
        if(current_state == s1)
            independence <= 1'b1;
        else
            independence <= 1'b0;
    end
    
    always @ (clk_10M)
    begin
        if((current_state == s1 && independence && bitsOut < 5) || (current_state == s1 && bitsOut >= 5) || current_state == s2)
            cs_nM <= 1'b0; // assert CS
        else if(current_state == s0)
            cs_nM <= 1'b1;
    end
    
    assign sclk = (cs_nM) ? 1'b1 : clk_10M;
        
    //state machine for shifting data out 
    always @ (negedge clk_10M)
    begin
        if(reset)
        begin
            ctrl_reg3_n <= 1'b0;
            status_reg <= 1'b0;
            get_magn_data <= 1'b0;
            get_magn_offset <= 1'b0;
            bitsOut <= 0;
        end
        
        //resets counter, assigns transferVal based on if data is ready and which register was last read from
        else if (current_state == s0)
        begin
            bitsOut <= 0; //reset the count of bits sent
            
            if(!ctrl_reg3_n)
                transferVal <= 16'h2200;    // write to control register
            else if(status_reg)
                transferVal <= 16'h2700 | 16'h8000; // read from status register
            else if(get_magn_offset)
                transferVal <= 16'h0500 | 16'hC000; // reaed from x and y offset registers
            else if(get_magn_data)
                transferVal <= 16'h2800 | 16'hC000; //read from x and y magnetometer registers
        end
                
        // shifts address out
        else if (current_state == s1)
        begin
            transferVal <= {transferVal[14:0], 1'b0}; // shift out the SPI transfer val
            mosi <= transferVal[15]; // write the MSB of the transfer val to MOSI
            bitsOut <= bitsOut + 1'b1; // and increment the count of bits sent
        end
        
        // sets flag for next address to read from
        else if (current_state == s2)
        begin
            if(!ctrl_reg3_n)
            begin
                ctrl_reg3_n <= 1'b1;
                get_magn_offset <= 1'b1;
            end
            
            else if(status_reg && (inVal[1:0] == 2'b11))
            begin
                status_reg <= 1'b0;
                get_magn_offset <= 1'b1;
            end
            
            else if(get_magn_offset)
            begin
                get_magn_offset <= 1'b0;
                get_magn_data <= 1'b1;
            end
            
            else if(get_magn_data)
            begin
                get_magn_data <= 1'b0;
                status_reg <= 1'b1;
            end
        end
    end
    
    reg [15:0] magnXoffset_2s, magnYoffset_2s;
    reg [15:0] magnXdata_2s, magnYdata_2s;
    
    reg dataInReady;
        
    //state machine for reading data in
    always @(posedge clk_10M)
    begin
        //resets values
        if(reset)
        begin
            inVal <= 0;
            dataInReady <= 1'b0;
        end
        
        else if(current_state == s0)
        begin
            inVal <= 0;
            
            if(status_reg)
                dataInReady <= 1'b0;
        end
        
        //reads in data after address has been shifted out
        else if(current_state == s1)
        begin
            if(bitsOut >= 8)
            begin
                inVal <= {inVal[30:0], miso};
            end
        end
        
        //stored data received into corresponding buffer
        else if(current_state == s2)
        begin
            if(get_magn_offset)
            begin
                magnXoffset_2s <= {inVal[23:16], inVal[31:24]};
                magnYoffset_2s <= {inVal[7:0], inVal[15:8]};
          end
            
            else if(get_magn_data)
            begin
                magnXdata_2s <= {inVal[23:16], inVal[31:24]};
                magnYdata_2s <= {inVal[7:0], inVal[15:8]};
           end
        end
    end
  
//-------------------------------------------------------------  
//-------------------------------------------------------------
//data processing block    
    
    reg data_en;
    
    always @ (posedge clk_100M)
    begin
        if((current_state == s2) && get_magn_data)
            data_en <= 1'b1;
        else
            data_en = 1'b0;
    end
        
//    assign data_en = (dataInReady == 2'b11);
    
    // regs/params for state machine control
    parameter [3:0] waits = 0, IPsubtracter = 1, invertY = 2, arcTan = 3, RadToDeg = 4, compassHeading = 5;
    reg [3:0] currentData_state, nextData_state;
    
    // State machine overhead control
    always @ (negedge clk_100M)
        if (reset)
            currentData_state <= waits;
        else
            currentData_state <= nextData_state;

    reg [1:0] IPsubtracter_count;
    reg [1:0] invertY_count;
    reg [4:0] arcTan_count;
    reg RadToDeg_count;

    //nest state logic
    always @ (currentData_state, data_en, IPsubtracter_count, invertY_count, arcTan_count, RadToDeg_count)
    begin
        case (currentData_state)
            //remains in s0 until a new en pulse
            waits:
                if(data_en)
                    nextData_state = IPsubtracter;
                else
                    nextData_state = waits;
            
            //IP subtracter
            IPsubtracter:
                if(IPsubtracter_count == 2)
                    nextData_state = invertY;
                else
                    nextData_state = IPsubtracter;
                    
            //multiplies y value by -1
            invertY:
                if(invertY_count == 2)
                    nextData_state = arcTan;
                else
                    nextData_state = invertY;                    
            
            //arcTan(x/y)
            arcTan:
                if(arcTan_count == 26)
                    nextData_state = RadToDeg;
                else
                    nextData_state = arcTan;
            
            //multiplies by 180
            RadToDeg:
                if(RadToDeg_count == 1)
                    nextData_state = compassHeading;
                else
                    nextData_state = RadToDeg;

            //calculated compass heading
            compassHeading:
                nextData_state = waits;
            
            default:
                nextData_state = waits;
        endcase
    end
    
    wire [15:0] magnX_2s, magnY_2s_n;
    reg [15:0] magnY_2s;
    reg [8:0] degrees;
    
    wire [2:0] sign;
    wire [4:0] decimal;
    
    wire [12:0] unscaled_degrees;
    
    //data processing state machine
    always @ (posedge clk_100M)
    begin
        case(currentData_state)
        
            waits:
            begin
                IPsubtracter_count <= 2'b00;
                invertY_count <= 5'b00000;
                arcTan_count <= 2'b00;
                RadToDeg_count <= 1'b0;
            end
        
            //delay 2 cycles for IP subtracters
            IPsubtracter:
            begin
                IPsubtracter_count <= IPsubtracter_count + 1'b1;
            end
        
            //inverts the y data point because of the IMU's direction 
            // connected to the PMOD with respect to the ZedBoard
            invertY:
            begin
                invertY_count <= invertY_count + 1'b1;
                
                if(invertY_count == 0)
                    magnY_2s <= ~magnY_2s_n;
                else if(invertY_count == 1)
                    magnY_2s <= magnY_2s + 1'b1;
            end
        
            //delay 26 cycles for IP arcTan - output in scaled radians
            arcTan:
            begin
                arcTan_count <= arcTan_count + 1'b1;
            end
        
            //converts to degrees by multiplying by 180
            //delays 1 cycle for IP constant coefficiant multiplier
            RadToDeg:
            begin
                RadToDeg_count <= RadToDeg_count + 1'b1;
            end
        
            //calculates compass degrees based on the y magnetometer data
            compassHeading:
            begin
                if(magnY_2s == 16'hFFFF || magnY_2s == 16'h0000)
                    if(magnX_2s[15] == 1'b0)
                        degrees <= 180;
                    else
                        degrees <= 0;
                else if(magnY_2s[15] == 1'b0)
                    if(sign[2] == 1'b0)
                        degrees <= 90 + unscaled_degrees[12:5];
                    else
                        degrees <= 90 - unscaled_degrees[12:5];
                else
                    if(sign[2] == 1'b0)
                        degrees <= 270 + unscaled_degrees[12:5];
                    else
                        degrees <= 270 - unscaled_degrees[12:5];
            end
        endcase
    end
    
    assign led[3] = (degrees >= 225 && degrees <= 315);
    assign led[2] = ((degrees >= 0 && degrees <= 45) || (degrees >= 315 && degrees <= 360));
    assign led[1] = (degrees >= 135 && degrees <= 225);
    assign led[0] = (degrees >= 45 && degrees <= 135);
    
    c_addsub_0 TwosCompSubX
    (
        .A(magnXdata_2s),
        .B(magnXoffset_2s),
        .CLK(clk_100M),
        .S(magnX_2s)
    );
    
    c_addsub_0 TwosCompSubY
    (
        .A(magnYdata_2s),
        .B(magnYoffset_2s),
        .CLK(clk_100M),
        .S(magnY_2s_n)
    );
    
    cordic_0 arcTangent
    (
        .s_axis_cartesian_tdata({2'b00, magnY_2s, 6'b000000, 2'b00, magnX_2s, 6'b00000}),
        .s_axis_cartesian_tvalid(1'b1),
        
        .aclk(clk_100M),
        
        .m_axis_dout_tvalid(),
        .m_axis_dout_tdata({sign, decimal})   // 3 sign bits, 5 decimal bits
    );
    
    mult_gen_0 RadiansToDegrees
    (
        .CLK(clk_100M),
        .A(decimal),
        .P(unscaled_degrees)
    );
    
//    mult_gen_1 DegToStep
//    (
//        .CLK(clk_100M),
//        .A(degrees[10:0]),
//        .P(stepOffset_shifted)
//    );
    
    clk_wiz_0 mmcm
    (
        .clk_in1(fpga_clk),
        .clk_100M(clk_100M),
        .clk_10M(clk_10M),
        .reset(reset),
        .locked()
    );
    
endmodule