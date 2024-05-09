module pc(clk_i, rst_ni , nop_i, nxt_pc, pc_o );
input [31:0] nxt_pc; 
input clk_i , rst_ni; 
input nop_i;
output reg [31:0] pc_o;

always @(posedge clk_i)
	if (!rst_ni) pc_o <= 0;
        else if (!nop_i) pc_o <= nxt_pc & 32'hfffffffc; // pc[1:0] luon bang = 0
endmodule
