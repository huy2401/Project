module branchpredict
(
    input clk_i,
    input rst_ni,
    input [7:0]pc_s0_i,
    input [4:0]opcode_s0,
    input [4:0]opcode_s2,
    input [7:0]pc_s2_i,
    input [10:0]pc_s2_j,
    input [31:0]pc_four_s0,
    input [31:0]pc_four_s2,
    input br_sel_s2,
    
    output reg reset,
    output reg[31:0] nxt_pc	
);

reg [10:0] predict[255:0];
reg [7:0] lht [255:0];
reg [255:0]jump[255:0];

always @(negedge clk_i)
if (rst_ni)
begin
       reset <= 1'b0; 
       if ((opcode_s0 == 5'b11000 && jump[pc_s0_i][lht[pc_s0_i]]) || opcode_s0 == 5'b11011 || opcode_s0 == 5'b11001)
       nxt_pc <= {19'b0,predict[pc_s0_i],2'b0};
       else nxt_pc <= pc_four_s0; 
       //////////////////////////////
       if (opcode_s2 == 5'b11000 || opcode_s2 == 5'b11011 || opcode_s2 == 5'b11001)
       begin
           if (predict[pc_s2_i]!=pc_s2_j || jump[pc_s2_i][lht[pc_s2_i]]!=br_sel_s2) 
           begin
                   reset <= 1'b1; 
                   if (br_sel_s2) nxt_pc <= {19'b0,pc_s2_j,2'b0};
                   else nxt_pc <= pc_four_s2; 
                   predict[pc_s2_i] <= pc_s2_j; 
                   jump[pc_s2_i][lht[pc_s2_i]] <= br_sel_s2;
           end 
           lht[pc_s2_i] <= {lht[pc_s2_i][6:0],br_sel_s2};  
      end 
end
else jump <= '{default:0};
endmodule





         
