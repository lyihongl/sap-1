//`timescale 1ns / 1ps
//`timescale 1ns/100ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2023 10:08:23 PM
// Design Name: 
// Module Name: main
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
// 'timescale 100ms / 1ms

module main(
    input wire clk,
    input wire rst,
    output wire[7:0] out
);

reg clk;

wire rst;
wire a_enable;
wire a_latch;

wire[7:0] data;
wire[7:0] data_out;
reg[7:0] data_in;
wire[7:0] a_reg_out;
assign data_out = data;
assign data = a_latch ? data_in : 8'bz;
//wire[7:0] outwire;
cpu c(clk, rst, out);
    
endmodule
