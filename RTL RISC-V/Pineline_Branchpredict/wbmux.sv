module wbmux(ld_data,alu_data,pc_four,wb_sel,wb_data);
output reg [31:0]wb_data;
input [31:0]ld_data,alu_data,pc_four;
input [1:0]wb_sel;
always_comb
	begin
	 case(wb_sel)
		2'b00: wb_data = ld_data; //DATAMEM
		2'b01: wb_data = alu_data; //ALU
		2'b10: wb_data = pc_four; //PC+4
		default wb_data = 0; 
	 endcase
	end
endmodule
