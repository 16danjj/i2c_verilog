`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: i2c_top
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


module i2c_top(
input clk, rst, newd, op,
input [6:0] addr,
input [7:0] din,
output [7:0] dout,
output busy, ack_err,
output done
    );
    
 wire sda, scl;
 wire ack_errm, ack_errs;
    
i2c_master master (clk,rst,newd,addr,op,sda,scl,din,dout,busy,ack_errm,done);    
i2c_slave slave (scl,clk,rst,sda,ack_errs,done); 

assign ack_err =   ack_errs | ack_errm;
endmodule
