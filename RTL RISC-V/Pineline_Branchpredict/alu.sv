module alu(alu_op,operand_a,operand_b,alu_data);
input [3:0] alu_op; 
input [31:0]operand_a,operand_b;
output reg [31:0] alu_data;
wire [31:0]temp0,temp1 ;
wire dau;

assign dau = operand_a[31] ^ operand_b[31];
assign temp0 = operand_a + ~operand_b + 1;
assign temp1 = dau         ? (operand_a[31]?   0 : 1):
                             {31'b0,temp0[31]} ;
 
always_comb begin : ALU_BLOCK
		case (alu_op) 
			4'b0000: alu_data = operand_a + operand_b; //ADD
			4'b1000: alu_data = temp0; //SUB
			4'b0001: alu_data = operand_a << operand_b[4:0] ;//SLL dich trai 
			4'b0010: alu_data = {31'b0 , temp0[31]};// SLT so sanh co dau               
			4'b0011: alu_data = temp1; //SLTU so sanh ko dau
			4'b0100: alu_data = operand_a ^ operand_b;//XOR
			4'b0101: alu_data = operand_a >> operand_b[4:0];//SRL dich phai ko dau
			4'b1101: alu_data = $signed(operand_a) >>> operand_b[4:0];//SRA dich phai co dau
			4'b0110: alu_data = operand_a | operand_b;//OR
			4'b0111: alu_data = operand_a & operand_b;//AND
			default: alu_data = operand_b; // LUI
		endcase	
	end
endmodule
