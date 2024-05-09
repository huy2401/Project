module pipelinestage3
(
         input clk_i,
         input rst_ni,
         input [31:0]pc_four_i,
         input [31:0]alu_data_i,
         input [4:0]rd_addr_i,
         input rd_wren_i,   
         input mem_wren_i,
         input [1:0]wb_sel_i,
         input [2:0]take_bit_i,
         input [31:0]rs2_data_i,
                
         output reg[31:0]pc_four_o,
         output reg[31:0]alu_data_o,
         output reg[4:0]rd_addr_o,
         output reg rd_wren_o,
         output reg mem_wren_o,
         output reg [1:0]wb_sel_o,
         output reg [2:0]take_bit_o,
         output reg [31:0]rs2_data_o
        
);

always @(posedge clk_i)
if (rst_ni)
begin
      rs2_data_o<=rs2_data_i;
      alu_data_o<=alu_data_i;
      pc_four_o<=pc_four_i;
      rd_addr_o<=rd_addr_i;
      rd_wren_o<=rd_wren_i;
      mem_wren_o<=mem_wren_i;
      wb_sel_o<=wb_sel_i;
      take_bit_o<=take_bit_i;
      rs2_data_o<=rs2_data_i;
end
else 
begin
      rs2_data_o<= 0;
      alu_data_o<= 0;
      pc_four_o<= 0;
      rd_addr_o<= 5'b0;
      rd_wren_o<= 1'b0;
      mem_wren_o<= 1'b0;
      wb_sel_o<=2'b0;
      take_bit_o<=3'b0;
      rs2_data_o<=0; 
end
endmodule
