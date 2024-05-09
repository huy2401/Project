module pipelinestage2
(
         input clk_i,
         input rst_ni,
         input nop_i,
         input [4:0 ] rd_addr_i,
         input [7:0] brcomp_i,
         input [17:0] ctrl_i,
         input [31:0] rs1_data_i,
         input [31:0] rs2_data_i,
         input [31:0] imm_i,
         input [31:0] pc_i,
         
         output reg[4:0 ] rd_addr_o,
         output reg[7:0]  brcomp_o,
         output reg[17:0] ctrl_o,
         output reg[31:0] rs1_data_o,
         output reg[31:0] rs2_data_o,
         output reg[31:0] imm_o,
         output reg[31:0] pc_o
);

always @(posedge clk_i)
if (rst_ni && !nop_i)
begin 
      pc_o<=pc_i;
      rs1_data_o<=rs1_data_i;
      rs2_data_o<=rs2_data_i;
      ctrl_o<=ctrl_i;
      imm_o<=imm_i;
      pc_o<=pc_i;
      brcomp_o<=brcomp_i;
      rd_addr_o<=rd_addr_i;
end
else
begin 
      pc_o<=0;
      rs1_data_o<=0;
      rs2_data_o<=0;
      ctrl_o<=0;
      imm_o<=0;
      pc_o<=0;
      brcomp_o<=8'b0;
      rd_addr_o<=5'b0;
end
endmodule
