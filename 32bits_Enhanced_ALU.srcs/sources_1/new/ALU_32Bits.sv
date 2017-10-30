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


module ALU_32Bits(a, b, Op_Code, out, Cf, Of, Zf, Sf);

//Ports Definition
    input   logic   [ 5:0] a;           //32bits operand 1
    input   logic   [ 5:0] b;           //32bits operand 2
    output  logic   [ 5:0] out;         //32bits Output
    input   logic   [ 3:0] Op_Code;     //4bits Operation Code
    output  logic          Cf;          //Carry Flag
    output  logic          Of;          //Overflow Flag
    output  logic          Zf;          //Zero Flag
    output  logic          Sf;          //Sign Flag
// -----------------------------------------------------------

//32bits Internal Variables Definition and assignments

    logic [31:0] A;                     //32bits opreand 1
    logic [31:0] B;                     //32bits opreand 2
    logic [31:0] Out;                   //32bits Output

    assign A = {a, 26'b0};              //length extension of a
    assign B = {b, 26'b0};              //length extension of b
    assign out = Out[31:26];4
// -----------------------------------------------------------

    logic [32:0] temp;
    assign Out = Op_Code == 4'b0000 ? A + B                                     :
                 Op_Code == 4'b0001 ? A + ~B + 1                                :
                 Op_Code == 4'b0010 ? A + 1                                     :
                 Op_Code == 4'b0011 ? A - 1                                     :
                 Op_Code == 4'b0100 ? A                                         :
                 Op_Code == 4'b0101 ? {A[30:0], A[31]}                          :
                 Op_Code == 4'b0110 ? {A[31:24] + B[31:24], A[23:16] + B[23:16],
                                       A[15: 8] + B[15: 8], A[ 7: 0] + B[ 7: 0]}: 
                 Op_Code == 4'b0111 ? A && B                                    :
                 Op_Code == 4'b1000 ? A || B                                    :
                 Op_Code == 4'b1001 ? A ^ B                                     :
                 Op_Code == 4'b1010 ? ~A                                        :
                 Op_Code == 4'b1011 ? ~A + 1                                    :'z;

    assign Cf = Op_Code == 4'b0000 ? (A[31] && ~ B[31] && ~Out[31]) || (~ A[31] && B[31] && ~ Out[31]) || (A[31] && B[31]  : 
                Op_Code == 4'b0010 ? (A[31] && ~ B[31] && ~Out[31]) || (~ A[31] && B[31] && ~ Out[31]) || (A[31] && B[31]  :
                Op_Code == 4'b1011 ? (A[31] && ~ B[31] && ~Out[31]) || (~ A[31] && B[31] && ~ Out[31]) || (A[31] && B[31]  : 0;

    assign Of = Op_Code == 4'b0000 ? (~A[31] && ~ B[31] &&  Out[31] ) || (A[31] && B[31] && ~ Out[31]) :
                Op_Code == 4'b0001 ? (~A[31] && ~ B[31] &&  Out[31] ) || (A[31] && B[31] && ~ Out[31]) :
                Op_Code == 4'b0010 ? (~A[31] && ~ B[31] &&  Out[31] ) || (A[31] && B[31] && ~ Out[31]) :
                Op_Code == 4'b0011 ? (~A[31] && ~ B[31] &&  Out[31] ) || (A[31] && B[31] && ~ Out[31]) :
                Op_Code == 4'b1011 ? (~A[31] && ~ B[31] &&  Out[31] ) || (A[31] && B[31] && ~ Out[31]) : 0;

    assign Sf = Op_Code == 4'b0000 ? Out[31] :
                Op_Code == 4'b0001 ? Out[31] :
                Op_Code == 4'b0010 ? Out[31] :
                Op_Code == 4'b0011 ? Out[31] :
                Op_Code == 4'b1011 ? Out[31] : 0;
                
    assign Zf = Out == 0? 1 : 0;
endmodule