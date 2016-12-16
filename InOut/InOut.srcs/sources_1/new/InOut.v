`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Passthrough for IMU
//////////////////////////////////////////////////////////////////////////////////

module InOut(
    // to PS Interface
    output miso_O,
    input sclk,
    input mosi,
    input cs_nM,
    // to IMU Module
    output sclk_O,
    output mosi_O,
    output cs_nAG_O,
    output cs_nALT_O,
    output cs_nM_O,
    input miso_I
    );
    
    // PL only ports
    assign cs_nAlt_O = 1'b1;
    assign cs_nAG_O = 1'b1;
    // to PS from PL
    assign miso_O = miso_I;
    // to PL from PS
    assign sclk_O = sclk;
    assign mosi_O = mosi;
    assign cs_nM_O = cs_nM;
    
endmodule
