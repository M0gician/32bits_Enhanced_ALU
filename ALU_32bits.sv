`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2017 07:40:00 PM
// Design Name: 
// Module Name: ALU_32bits
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


module ALU_32bits(a, b, Op_Code, out, Cf, Of, Zf, Sf);

//Ports definition
    input logic [5:0] a;                //6 bits op1, comes from switched
    input logic [5:0] b;                //6 bits op2, comes from switches
    input logic [3:0] Op_Code;          //4bits operation code
    output logic [5:0] out;             //6 bits result, goes to LEDs
    output logic Cf;                    //Carry flag
    output logic Of;                    //Overflow flag
    output logic Zf;                    //Zero flag
    output logic Sf;                    //Sign flag
    
//------------------------------------------------------------------------------------------//

//32 bits internal variables definition and assignments

    logic [31:0] A;
    logic [31:0] B;
    logic [31:0] Out;
    
    assign A = {a, 26'b0};
    assign B = {b, 26'b0};
    assign out = Out[31:26];
//------------------------------------------------------------------------------------------//
    
    logic [31:0] temp1;
    logic [31:0] temp2;
    //logic [32:0] temp3;
    
    assign temp1 = (Op_Code == 4'b0000)? A+B:
                 (Op_Code == 4'b0001)? A+(~B)+1:
                 (Op_Code == 4'b0010)? A+1:
                 (Op_Code == 4'b0011)? A-1:
                 (Op_Code == 4'b0100)? A:
                 (Op_Code == 4'b0101)? A<<1:
                 (Op_Code == 4'b0111)? A&B:
                 (Op_Code == 4'b1000)? A|B:
                 (Op_Code == 4'b1001)? A^B:
                 (Op_Code == 4'b1010)? (~A):
                 (Op_Code == 4'b1011)? (~A)+1:
                                      (32'bz);
                                      
    assign temp2[7:0] = (Op_Code == 4'b0110)? A[7:0] + B[7:0]:(32'bz);
    assign temp2[15:8] = (Op_Code == 4'b0110)? A[15:8] + B[15:8]:(32'bz);
    assign temp2[23:16] = (Op_Code == 4'b0110)? A[23:16] + B[23:16]:(32'bz);
    assign temp2[31:24] = (Op_Code == 4'b0110)? A[31:24] + B[31:24]:(32'bz);

    assign Out = (Op_Code == 4'b0110)? temp2: temp1;
    
    //assign temp3 = (Op_Code == 4'b0000)? A+B:33'bz;
    
    assign Zf = (Out == 0)? 1:0;
    assign Sf = (Op_Code == 4'b0000)? Out[31]:
                (Op_Code == 4'b0001)? Out[31]: 
                                            32'bz;
    assign Cf = (Op_Code == 4'b0000)? temp3[32]: 32'bz;
    assign Of = (Op_Code == 4'b0000)? (~A[31]&~B[31]&Out[31])|(A[31]&B[31]&~Out[31]):
                (Op_Code == 4'b0001)? (~A[31]&~B[31]&Out[31])|(A[31]&B[31]&~Out[31]): 
                                                                                    32'bz;
                                    
endmodule    
////------------------------------------------------------------------



    
    



