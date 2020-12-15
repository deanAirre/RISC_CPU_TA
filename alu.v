`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module alu(alu_out, alu_in, accum, op);//  arithmetic logic unit
    // to perform arithmetic and logic operations.
input [3:0] op;
input [7:0] alu_in,accum;
output reg [7:0] alu_out;

parameter 	NOP=3'b000,
			LDO=4'b0001,
			LDA=4'b0010,
			STO=4'b0011,
			PRE=4'b0100,
			ADD=4'b0101,
			LDM=4'b0110,
			HLT=4'b0111,
			AND=4'b1000,
			OR=4'b1001,
			SLEF=4'b1010,
			SRIG=4'b1011,
			SUB=4'b1100,
			INC=4'b1101,
			DEC=4'b1110,
			XOR=4'b1111;


always @(*) begin
		casez(op)
		NOP:	alu_out = accum;
		HLT:	alu_out = accum;
		LDO:	alu_out = alu_in;
		LDA:	alu_out = alu_in;
		STO:	alu_out = accum;
		PRE:	alu_out = alu_in;
		ADD:	alu_out = accum+alu_in;
		LDM:	alu_out = accum;
		AND:	alu_out = accum&alu_in;
		OR:	alu_out = accum|alu_in;
//		SLEF:	alu_out = accum;
//		SRIG:	alu_out = accum;
		SUB:	alu_out = accum-alu_in;
		INC:	alu_out = accum+1;
		DEC:	alu_out = accum-1;
		XOR:	alu_out = accum^alu_in;
		
		default:	alu_out = 8'bzzzz_zzzz;
		endcase
end
			 
			
endmodule
