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
    parameter [1:0] s0 = 2'b00, s1 = 2'b01, s2 = 2'b11;
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
    
    reg ctrl_reg3, ctrl_reg1_n, ctrl_reg2, status_reg, get_magn_data, get_magn_offset;
    
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
                if (((get_magn_data || get_magn_offset) && bitsOut == 39) ||
                    ((status_reg || ctrl_reg3 || !ctrl_reg1_n || ctrl_reg2) && bitsOut == 15))
                    next_state = s2;
                else
                    next_state = s1;
                    
            s2:
                next_state = s0;
                    
            default:
                next_state = s0;
        endcase
    end
    
    reg trigger;  // triggers the chip select to go low on posedge clk_10M
    
    always @ (posedge clk_10M)
    begin
        if(current_state == s1)
            trigger <= 1'b1;
        else
            trigger <= 1'b0;
    end
    
    always @ (clk_10M)
    begin
        if((current_state == s1 && trigger && bitsOut < 5) || (current_state == s1 && bitsOut >= 5) || current_state == s2)
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
            ctrl_reg1_n <= 1'b0;
            ctrl_reg2 <= 1'b0;
            ctrl_reg3 <= 1'b0;
            status_reg <= 1'b0;
            get_magn_data <= 1'b0;
            get_magn_offset <= 1'b0;
            bitsOut <= 0;
        end
        
        //resets counter, assigns transferVal based on if data is ready and which register was last read from
        else if (current_state == s0)
        begin
            bitsOut <= 0; //reset the count of bits sent
            
            if(!ctrl_reg1_n)
                transferVal <= 16'h207C;
            else if(ctrl_reg2)
                transferVal <= 16'h2100;
            else if(ctrl_reg3)
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
            if(!ctrl_reg1_n)
            begin
                ctrl_reg1_n <= 1'b1;
                ctrl_reg2 <= 1'b1;
            end
            
            else if(ctrl_reg2)
            begin
                ctrl_reg2 <= 1'b0;
                ctrl_reg3 <= 1'b1;
            end
            
            else if(ctrl_reg3)
            begin
                ctrl_reg3 <= 1'b0;
                status_reg <= 1'b1;
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
    
    reg data_en;
        
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
            if(status_reg)
            begin
                data_en <= 1'b0;
            end
        
            else if(get_magn_offset)
            begin
                magnXoffset_2s <= {inVal[23:16], inVal[31:24]};
                magnYoffset_2s <= {inVal[7:0], inVal[15:8]};
                
                data_en <= 1'b0;
            end
            
            else if(get_magn_data)
            begin
                magnXdata_2s <= {inVal[23:16], inVal[31:24]};
                magnYdata_2s <= {inVal[7:0], inVal[15:8]};
                
                data_en <= 1'b1;
           end
        end
    end
  
//-------------------------------------------------------------  
//-------------------------------------------------------------
//data processing block    
            
    // regs/params for state machine control
    parameter [3:0] waits = 4'd0, IPsubtracter = 4'd1, invertY = 4'd2, domainChange = 4'd3, reverseBitOrder = 4'd4, arcTan = 4'd5, formatting = 4'd6, RadToDeg = 4'd7, compassHeading = 4'd8;
    reg [3:0] currentData_state, nextData_state;
    
    // State machine overhead control
    always @ (negedge clk_100M)
        if (reset)
            currentData_state <= waits;
        else
            currentData_state <= nextData_state;

    reg [1:0] IPsubtracter_count;
    reg [1:0] invertY_count;
    reg [5:0] domainChange_count;
    reg [4:0] reverseBitOrder_count;
    reg [3:0] arcTan_count;
    reg [1:0] formatting_count;
    reg [4:0] RadToDeg_count;
    
    reg [8:0] degrees;

    //nest state logic
    always @ (currentData_state, data_en, IPsubtracter_count, invertY_count, domainChange_count, reverseBitOrder_count, arcTan_count, formatting_count, RadToDeg_count)
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
                if(invertY_count == 3)
                    nextData_state = domainChange;
                else
                    nextData_state = invertY;                    
            
            domainChange:
                if(domainChange_count == 36)
                    nextData_state = reverseBitOrder;
                else
                    nextData_state = domainChange;
            
            //reverses bit order        
            reverseBitOrder:
                if(reverseBitOrder_count == 16)
                    nextData_state = arcTan;
                else
                    nextData_state = reverseBitOrder;
            
            //arcTan(x/y)
            arcTan:
                if(arcTan_count == 15)
                    nextData_state = formatting;
                else
                    nextData_state = arcTan;
            
            //formats data from 3QN format to a shifted unsigned integer        
            formatting:
                if(formatting_count == 2)
                    nextData_state = RadToDeg;
                else
                    nextData_state = formatting;
            
            //multiplies by 180
            RadToDeg:
                if(RadToDeg_count == 31)
                    nextData_state = compassHeading;
                else
                    nextData_state = RadToDeg;

            //calculated compass heading
            compassHeading:
                nextData_state = waits;
                
//            scaling:
//                if(degrees < 360)
//                    nextData_state = waits;
//                else
//                    nextData_state = scaling;
            
            default:
                nextData_state = waits;
        endcase
    end
    
    wire [15:0] magnX_2s, magnY_2s_n;
    reg [15:0] magnY_2s;
    
    wire [1:0] phase_wire;
    wire [7:0] decimal_wire;
    
    wire sign;
    reg [1:0] phase;
    reg [7:0] decimal;
    
    wire [16:0] unscaled_degrees;
    
    //data processing state machine
    always @ (posedge clk_100M)
    begin
        case(currentData_state)
        
            //waits for data ready signal to begin data processing state machine
            waits:
            begin
                IPsubtracter_count <= 2'b00;
                invertY_count <= 2'b00;
                domainChange_count <= 6'b000000;
                reverseBitOrder_count <= 5'b00000;
                arcTan_count <= 4'b0000;
                formatting_count <= 2'b00;
                RadToDeg_count <= 4'b0000;
                
//                led = 8'h00;
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
                
                if(invertY_count == 1)
                    magnY_2s <= ~magnY_2s_n;
                else if(invertY_count == 2)
                    magnY_2s <= magnY_2s + 1'b1;
            end
            
            //scales the magnetometer data from -32768 <= x, y <= 32767
            //to -1 <= x, y < 1 for domain input to arcTan IP
            domainChange:
            begin
                domainChange_count <= domainChange_count + 1'b1;
            end
            
            reverseBitOrder:
            begin
                reverseBitOrder_count <= reverseBitOrder_count + 1'b1;
            end
            
            //delay 26 cycles for IP arcTan - output in scaled radians
            arcTan:
            begin
                arcTan_count <= arcTan_count + 1'b1;
            end
        
            //
            formatting:
            begin
                formatting_count <= formatting_count + 1'b1;
                
                if(sign)
                begin
                    if(formatting_count == 0)
                        phase <= ~phase_wire;
                    else if(formatting_count == 1)
                    begin
                        phase <= phase + 1'b1;
                        decimal <= decimal_wire + 1'b1;
                    end
                end
                else
                begin
                    phase <= phase_wire;
                    decimal <= decimal_wire;
                end
                
            end
        
            //converts to degrees by multiplying by 180
            //delays 2 cycles for IP constant coefficiant multiplier
            RadToDeg:
            begin
                RadToDeg_count <= RadToDeg_count + 1'b1;
            end
        
            //calculates compass degrees based on the y magnetometer data
            compassHeading:
            begin
                if(sign)
                    degrees <= 360 - unscaled_degrees[15:8];
                else
                    degrees <= unscaled_degrees[15:8];
            end
            
//            //makes degrees < 360
//            scaling:
//            begin
//                if(degrees >= 360)
//                    degrees <= degrees - 360;
//            end
        endcase
    end
    
//    assign led = (button) ? degrees :
//                (degrees >= 225 && degrees <= 315) ? 8'b0000_1000 :
//                ((degrees >= 0 && degrees <= 45) || (degrees >= 315 && degrees <= 360)) ? 8'b00000100 :
//                (degrees >= 135 && degrees <= 225) ? 8'b00000010 :
//                (degrees >= 45 && degrees <= 135) ? 8'b00000001 : 8'b10000000;

    
//    assign led[3] = (degrees >= 225 && degrees <= 315);
//    assign led[2] = ((degrees >= 0 && degrees <= 45) || (degrees >= 315 && degrees <= 360));
//    assign led[1] = (degrees >= 135 && degrees <= 225);
//    assign led[0] = (degrees >= 45 && degrees <= 135);
    
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
    
    wire [15:0] quotientX, quotientY;
    wire [15:0] fractionalX, fractionalY;
    
    wire [15:0] decimalX, decimalY;
    
    assign led = (button) ? degrees : {magnXdata_2s[15], magnYdata_2s[15], magnXoffset_2s[15], magnYoffset_2s[15],  magnX_2s[15], magnY_2s[15], quotientX[15], quotientY[15]};
    
    genvar i;
    generate
    for(i = 0; i < 16; i = i + 1)
    begin : reverseBits
        assign decimalX[i] = fractionalX[15-i];
        assign decimalY[i] = fractionalY[15-i];
    end
    endgenerate
    
    div_gen_0 RadtoArcTanDomainX
    (
        .s_axis_dividend_tdata(magnX_2s),
        .s_axis_dividend_tvalid(1'b1),
        
        .s_axis_divisor_tdata(17'd32768),
        .s_axis_divisor_tvalid(1'b1),
        
        .aclk(clk_100M),
        
        .m_axis_dout_tdata({quotientX, fractionalX}),
        .m_axis_dout_tvalid()
    );
    
    div_gen_0 RadtoArcTanDomainY
    (
        .s_axis_dividend_tdata(magnY_2s),
        .s_axis_dividend_tvalid(1'b1),
        
        .s_axis_divisor_tdata(17'd32768),
        .s_axis_divisor_tvalid(1'b1),
        
        .aclk(clk_100M),
        
        .m_axis_dout_tdata({quotientY, fractionalY}),
        .m_axis_dout_tvalid()
    );
    
    wire [4:0] pad;
       
    cordic_0 arcTangent
    (
        .s_axis_cartesian_tdata({6'b000000, quotientX[15], quotientX[0], decimalX, 6'b000000, quotientY[15], quotientY[0], decimalY}),
        .s_axis_cartesian_tvalid(1'b1),
        
        .aclk(clk_100M),
        
        .m_axis_dout_tvalid(),
        .m_axis_dout_tdata({pad, sign, phase_wire, decimal_wire})   // 5 bit padding, sign bit, 2 phase bits, 8 decimal bits
    );
    
    mult_gen_0 RadiansToDegrees
    (
        .CLK(clk_100M),
        .A({phase[0], decimal}),
        .P(unscaled_degrees)
    );
//    assign unscaled_degrees = {phase,decimal[7:0]}*180;
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