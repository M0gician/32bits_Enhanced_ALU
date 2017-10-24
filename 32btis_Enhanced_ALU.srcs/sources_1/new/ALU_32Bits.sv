`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2017 10:20:35 PM
// Design Name: 
// Module Name: ALU_32Bits
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


module ALU_32Bits(A, B, Op_Code, Out, Cf, Of, Zf, Sf);

//Ports Definition
    input   logic   [31:0] A;       //32bits operand 1
    input   logic   [31:0] B;       //32bits operand 2
    input   logic   [ 3:0] Op_Code; //4bits Operation Code
    output  logic   [31:0] Out;     //32bits Output
    output  logic Cf;               //Carry Flag
    output  logic Of;               //Overflow Flag
    output  logic Zf;               //Zero Flag
    output  logic Sf;               //Sign Flag
// -----------------------------------------------------------

endmodule
