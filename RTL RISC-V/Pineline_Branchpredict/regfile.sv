module regfile(
                 input clk_i,
                 input rst_ni, 
                 input rd_wren,
      	         input [4:0] rs1_addr,
           	 input [4:0] rs2_addr,
	         input [4:0] rd_addr,
	         input [31:0] rd_data,
	         output logic[31:0] rs1_data,
	         output logic[31:0] rs2_data
             );
reg  [31:0]reg32[0:31];
assign  rs1_data = reg32[rs1_addr];
assign  rs2_data = reg32[rs2_addr];

always @(negedge clk_i)
begin 
    if (rst_ni)  
    begin          
            if (rd_wren) reg32[rd_addr] <= rd_data;
            reg32[0] <= 0;
    end     
	 else reg32 <= '{default :0}; 
    //$writememh(".memory/regfile.data", reg32);
end
endmodule 
