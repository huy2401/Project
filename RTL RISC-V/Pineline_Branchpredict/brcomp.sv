module brcomp(rs1_data,rs2_data,brcomp_i,br_sel_i,br_sel_o);
input br_sel_i;
input [7:0]brcomp_i;
input logic[31:0] rs1_data,rs2_data;
output logic br_sel_o;
logic dau0,dau1,br_equal,br_less,br_unsigned;
wire [31:0]temp;

assign br_unsigned = brcomp_i[7] && brcomp_i[6];
assign temp = rs1_data + ~rs2_data + 1; //ss co dau
assign dau0 = temp[31];
assign dau1 = (rs1_data[31] ^ rs2_data[31])?  ~rs1_data[31] : dau0; //ss ko dau 
assign br_equal = (rs1_data==rs2_data) ? 1'b1 : 1'b0;
assign br_less  = br_unsigned ? dau1 : dau0;
   
always_comb
if (brcomp_i[4:0] == 5'b11000) // neu lenh B-type
casez ({brcomp_i[7:5],br_equal,br_less})
                5'b0001?: br_sel_o = 1'b1; 
		          5'b0010?: br_sel_o = 1'b1;
		          5'b100?1: br_sel_o = 1'b1;
		          5'b110?1: br_sel_o = 1'b1;
                5'b101?0: br_sel_o = 1'b1;
                5'b111?0: br_sel_o = 1'b1;
                default:br_sel_o = 1'b0; 
endcase
else br_sel_o = br_sel_i; 
endmodule
