`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module rom(data, addr, read, ena);
input read, ena;
input [7:0] addr;
output [7:0] data;
 
reg [7:0] memory[255:0];


// note: Decimal number in the bracket
initial begin
	memory[0] = 8'b0000_0000;	//NOP
	
	// [ins] [target_reg_addr] [from_rom_addr]
	memory[1] = 8'b0001_0001;	//LDO s1
	memory[2] = 8'b0110_0001;	//rom(97)	//rom[97] -> reg[1]
	memory[3] = 8'b0001_0010;	//LDO s2
	memory[4] = 8'b0110_0010;	//rom(98)
	memory[5] = 8'b0001_0011;	//LDO s3
	memory[6] = 8'b0110_0011;	//rom(99)

	memory[7] = 8'b0100_0001;	//PRE s1
	memory[8] = 8'b0101_0010;	//ADD s2
	memory[9] = 8'b0110_0001;	//LDM s1
	
	memory[10] = 8'b0011_0001;	//STO s1
	memory[11] = 8'b0000_0001;	//ram(1)
	memory[12] = 8'b0010_0010;	//LDA s2
	memory[13] = 8'b0000_0001;	//ram(1)
	
	
	memory[14] = 8'b0100_0011;	//PRE s3
	memory[15] = 8'b1101_0001;	//DEC
	memory[16] = 8'b0101_0010;	//ADD s2
	memory[17] = 8'b0110_0011;	//LDM s3
	
	memory[18] = 8'b0011_0011;	//STO s3
	memory[19] = 8'b000_00010;	//ram(2)
	
	memory[20] = 8'b0001_0100;	//LDO s4
	memory[21] = 8'b0110_0100;	//rom(100)
	
	memory[22] = 8'b1101_0001;	//INC
	
	memory[23] = 8'b0100_0010;	//PRE s2
	memory[24] = 8'b1100_0100;	//SUB s4
	memory[25] = 8'b0110_0100;	//LDM s4
	
	memory[26] = 8'b0011_0100;	//STO s4
	memory[27] = 8'b0000_0011;	//ram(3)
	memory[28] = 8'b0010_0101;	//LDA s5
	memory[29] = 8'b0000_0011;	//ram(3)
	
	memory[30] = 8'b1000_0101; //AND s5
	memory[31] = 8'b0110_0110;	//LDM s6
	memory[32] = 8'b1001_0101; //OR s5
	memory[33] = 8'b0110_0111;	//LDM s7
	memory[34] = 8'b1001_0101; //XOR s5
	memory[35] = 8'b0110_1000;	//LDM s8
	memory[36] = 8'b0011_0110;	//STO s6
	memory[37] = 8'b0000_0100;	//ram(4)
	
	memory[38] = 8'b0010_0110;	//LDA s6
	memory[39] = 8'b0000_0100;	//ram(4)
	
	memory[40] = 8'b0111_0000;	//HLT
	
	memory[97] = 8'b0001_0101;	//21
	memory[98] = 8'b0010_1001;	//41
	memory[99] = 8'b0001_0101;	//21
	memory[100] = 8'b0000_0101; //5
end


assign data = (read&&ena)? memory[addr]:8'hzz;	

endmodule
