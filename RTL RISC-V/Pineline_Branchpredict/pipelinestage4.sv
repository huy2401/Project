module pipelinestage4
(
         input clk_i,
         input rst_ni,
         input rd_wren_i,
         input [4:0] rd_addr_i,
         input [31:0] wb_data_i,
                  
         output reg rd_wren_o,
         output reg[4:0]  rd_addr_o,
         output reg[31:0] wb_data_o
);

always @(posedge clk_i)
if (rst_ni)
begin
         rd_addr_o<=rd_addr_i;
         rd_wren_o<=rd_wren_i;
         wb_data_o<=wb_data_i;
end
else
begin    
         rd_addr_o<=5'b0;
         rd_wren_o<=1'b0;
         wb_data_o <=0;
end
endmodule
