module immgen( 
	input [31:0] instr, 
	output reg [31:0] imm);

always_comb 
begin
imm = 0;
casez (instr[6:0])
	7'b00?0011://I
		begin
		imm[10:0] = instr[30:20];
		imm[31:11] = {21{instr[31]}};
		end      
	7'b0100011://S
		begin
		imm[4:0] = instr[11:7];
		imm[10:5] = instr[30:25];
		imm[31:11] = {21{instr[31]}};
		end
	7'b1100011://B
		begin
		imm[0] = 0;
		imm[4:1] = instr[11:8]; 
		imm[10:5] = instr[30:25];
		imm[11] = instr[7];
		imm[31:12] = {20{instr[31]}};
		end
        7'b0?10111: imm[31:12] = instr[31:12];//LUI,AUIPC
	7'b1101111://JAL 
                begin
                imm[10:1] = instr[30:21];
		imm[11] = instr[20];
		imm[20] = instr[31];
		imm[19:12] = instr[19:12];
		imm[31:21] = {11{instr[31]}};
	        end
        7'b1100111:imm = {{20{instr[31]}},instr[31:20]};//JALR
	default : imm = 0;
endcase
end
endmodule
