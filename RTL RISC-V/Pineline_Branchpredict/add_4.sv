module add_4(input [31:0]pc_i,
             output reg [31:0] pc_four);

assign pc_four = pc_i+4;
endmodule 
