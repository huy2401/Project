module pipelinestage1 
(
         input clk_i,
         input nop_i,
         input rst_ni,  
         input [31:0] pc_i,
         input [31:0] instr_i,
         input [17:0] ctrl_i,

         output reg[31:0] pc_o,
         output reg[31:0] instr_o,
         output reg[17:0] ctrl_o
);

always @(posedge clk_i)
if (!rst_ni || nop_i)
begin 
      pc_o <= 0;
      instr_o <= 0;
      ctrl_o <= 0;
end
else 
begin 
      pc_o<=pc_i;
      instr_o<=instr_i;
      ctrl_o <=ctrl_i;   
end
endmodule
