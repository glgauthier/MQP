`timescale 1ns / 1ps

module IMU_top(
    input button, // 16kHz clock pulse (16kHz*16 writes = 1mS period)
    input fpga_clk, // 4MHz clock for creating sclk
    input reset, // asynchronous reset
    output sclk,
    output reg mosi,
    output reg cs_n,
    input miso
    );
    
    wire clk_15M;
        
    wire clk_100M;
    reg [15:0] transferVal, inVal;
    reg [15:0] gyroZ;
    
    reg [6:0] time_counter;
    reg [6:0] time_buf;
   
    // regs/params for state machine control
    parameter [1:0] s0 = 0, s1 = 1, s2 = 2;
    reg [1:0] current_state, next_state;
     
    reg [3:0] bitsOut, bitsIn; // SPI bit transfer counter (0-15)
    reg [4:0] Count;
    reg [2:0] SPI_counter;

    // write enable signal, triggered by button pulse
    wire en;
//    assign en = (button == 1'b1);
    assign en = (SPI_counter == 3'b111);
    
    //waits 8 clock cycles between SPI transfers
    always @ (posedge clk_15M, posedge reset)
    begin
        if(reset || !cs_n)
            SPI_counter <= 3'b000;
        else
            SPI_counter <= SPI_counter + 1'b1;
    end
     
    // State machine overhead control
    //  - asynchronous reset
    //  - jump to s1 (SPI write) on clk_en 
    //  - otherwise, increment to next_state
    always @ (negedge clk_15M, posedge reset)
        if (reset)
            current_state <= s0;
        else if (en)
            current_state <= s1;
        else
            current_state <= next_state;
                     
    // Change next_state based on the SPI write sequence
    //        s0: reset shift register for next write seq.
    //        s1: assert CS, write to DAC
    //        s2: de-assert CS, increment write counter
    always @ (current_state, bitsOut, transferVal)
    begin
        case (current_state)
            // The state machine will remain in s0 until a new en pulse
            s0:
                next_state = s0;
            
            // The state machine will remain in s1 for the entirety of an SPI transfer
            s1:
                if (bitsOut == 4'b1111)
                    next_state = s2;
                else
                    next_state = s1;
                    
            // After an SPI transfer, s2 is used to increment the write count
            s2:
                next_state = s0;

            default:
                next_state = s0;
        endcase
    end
    
    reg independence;  // declaration of independence
    
    always @ (posedge clk_15M)
    begin
        if(current_state == s1)
            independence <= 1'b1;
        else
            independence <= 1'b0;
    end
    
    always @ (clk_15M)
    begin
        if((current_state == s1 && independence && bitsOut < 5) || (current_state == s1 && bitsOut >= 5) || current_state == s2)
            cs_n <= 1'b0; // assert CS
        else if(current_state == s0)
            cs_n <= 1'b1;
    end
    
//    assign sclk = (current_state == s1 && independence && bitsOut < 5) || (current_state == s1 && bitsOut >= 5) || current_state == s2 ? clk_15M : 1'b1;
    assign sclk = (cs_n) ? 1'b1 : clk_15M;
    
    //state machine for shifting data out 
    always @ (negedge clk_15M, posedge reset)
    begin
        if(reset)
            transferVal <= 16'h7E00;
            
        // if in S1 (currently transferring a value)
        else if (current_state == s1)
        begin
            transferVal <= {transferVal[14:0],1'b0}; // shift out the SPI transfer val
            mosi <= transferVal[15]; // write the MSB of the transfer val to MOSI
            bitsOut <= bitsOut + 1'b1; // and increment the count of bits sent
        end
        
        // if in S2 or S0 (not currently transferring a value)
        else
        begin
            bitsOut <= 0; // reset the count of bits sent
            // reset the transfer val for next write seq
//            if(transferVal == 16'h1800)
//                transferVal <= 16'h1A00;
//            else if(transferVal == 16'h1A00)
//                transferVal <= 16'h1800;
            transferVal <= 16'h7E00;
        end
    end
    
    //state ma chine for shifting data in
    always @(posedge clk_15M, posedge reset)
    begin
        if(reset)
        begin
            inVal <= 16'h0000;
        end
        
        // if in S1 (currently transferring a value)
        else if (current_state == s1)
        begin
            inVal[bitsOut] <= miso; // write the MSB of the transfer val to MOSI
            bitsIn <= bitsIn + 1'b1; // and increment the count of bits sent
        end
        
        // if in S2 or S0 (not currently transferring a value)
        else
        begin
            bitsIn <= 16'b0000;
        end
    end    
    
    //buffer for gyroscope Z-axis data in and time
    always @ (bitsIn, time_counter)
    begin
        //end of SPI transfer
        if(bitsIn == 4'b1111)
        begin
//            if(transferVal == 16'h1A00)
//                gyroZ[31:16] <= bitsIn;
//            else if(transferVal == 16'h1800)
//                gyroZ[15:0] <= bitsIn;
            gyroZ <= bitsIn;
            time_buf <= time_counter;
        end
    end
    
    //counts clock cycles between data transfers
    always @ (posedge clk_15M, posedge reset)
    begin
        if(reset || bitsIn == 4'b1111)
            time_counter <= 7'b0;
        else
            time_counter <= time_counter + 1'b1;
    end
  
//-------------------------------------------------------------  
//-------------------------------------------------------------
//data processing block    
    
    wire data_en;
    assign data_en = (bitsIn == 4'b1111);
    
    // regs/params for state machine control
    parameter [2:0] ds0 = 0, ds1 = 1, ds2 = 2, ds3 = 3;
    reg [1:0] currentData_state, nextData_state;
    
    // State machine overhead control
    //  - asynchronous reset
    //  - jump to s1 (SPI write) on clk_en
    //  - otherwise, increment to next_state
    always @ (negedge clk_100M, posedge reset)
        if (reset)
            currentData_state <= ds0;
        else if (data_en)
            currentData_state <= ds1;
        else
            currentData_state <= nextData_state;

    reg [3:0] ds2count;
    reg [5:0] ds3count;

    //nest state logic
    always @ (currentData_state, ds2count, ds3count)
    begin
        case (currentData_state)
            //remains in s0 until a new en pulse
            ds0:
            begin
                nextData_state = ds0;
            end
            
            //remains in ds1 for 2 clock cycles - decoding 2s comp
            ds1:
            begin
                    nextData_state <= ds2;
            end
            
            //remains in ds2 for 
            ds2:
                if(ds2count == 7)
                    nextData_state = ds3;
                
            //remains in ds3 for 
            ds3:
            begin
                if(ds3count == 50)
                    nextData_state = ds0;
            end

            
            default:
                nextData_state = ds0;
        endcase
    end
    
    reg [15:0] gyroZ_data;
    reg positive;
    wire [36:0] P;
    reg [36:0] gyroZ_scale;
    reg gyroZ_scale_valid;
    wire [47:0] stepOffset_sl2;
    reg [46:0] stepOffset;

    //data processing state machine
    always @ (posedge clk_100M, posedge reset)
    begin
        if(reset || currentData_state == ds0)
        begin
            ds2count <= 3'b0;
            ds3count <= 5'b0;
            gyroZ_scale_valid <= 1'b0;
        end
        
        //decode 2s comp
        else if(currentData_state == ds1)
        begin
            if(!gyroZ[15])
            begin
                positive <= 1'b1;
                gyroZ_data <= gyroZ;
            end
            else
            begin
                positive <= 1'b0;
                gyroZ_data <= ~gyroZ + 1'b1;
            end
        end
        
        //multiplies gryoZ velocity by constant {f*(deg/sec/LSB)/(degrees/step)}
        else if(currentData_state == ds2)
        begin
            ds2count <= ds2count + 1'b1;
            if(ds2count == 6)
            begin
                gyroZ_scale <= P;
                gyroZ_scale_valid <= 1'b1;
            end
        end
        
        //divides by time counter to get (step offset << 2)
        else if(currentData_state == ds3)
        begin
            ds3count <= ds3count + 1'b1;
            if(ds3count == 49)
            begin
                stepOffset <= stepOffset_sl2[47:1];
                gyroZ_scale_valid <= 1'b0;
            end
        end
        
    end
    
    mult_gen_0 mult
    (
        .CLK(clk_100M),
        .A(gyroZ_data),
        .P(P)
    );
    
    div_gen_0 div
    (
        .aclk(clk_100M),
        .s_axis_dividend_tdata({3'b0, gyroZ_scale}),
        .s_axis_dividend_tvalid(gyroZ_scale_valid),
        .s_axis_divisor_tdata(time_buf),
        .s_axis_divisor_tvalid(1'b1),
        .m_axis_dout_tdata(stepOffset_sl2)
    );
    
    clk_wiz_0 mmcm
    (
        .clk_in1(fpga_clk),
        .reset(reset),
        .clk_100M(clk_100M),
        .clk_15M(clk_15M)
    );
    
endmodule
