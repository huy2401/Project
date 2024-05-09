module control(
                  input  logic [18:0] ctrl,
                  input  logic [4:0]  rd_s1,
                  input  logic [4:0]  rd_s2,
                  input  logic rd_wren_s1, 
                  input  logic rd_wren_s2, 
                  input  logic [4:0]opcode_s1,
                  output logic nop,     
    	          output logic [17:0] data_out
               );

reg [4:0]rs1_s0,rs2_s0;
wire [2:0] code;
wire rd_avail_s1,rd_avail_s2,Haz_rs1_s1,Haz_rs2_s1,Haz_rs1_s2,Haz_rs2_s2;
assign rd_avail_s1 = rd_s1 != 5'b0   && rd_wren_s1;
assign rd_avail_s2 = rd_s2 != 5'b0   && rd_wren_s2;
assign Haz_rs1_s1  = rd_s1 == rs1_s0 && rd_avail_s1;
assign Haz_rs2_s1  = rd_s1 == rs2_s0 && rd_avail_s1;
assign Haz_rs1_s2  = rd_s2 == rs1_s0 && rd_avail_s2;
assign Haz_rs2_s2  = rd_s2 == rs2_s0 && rd_avail_s2;  

assign code = ctrl[7:5]; 
always_comb
begin
        rs1_s0 = ctrl[12:8];
        rs2_s0 = ctrl[17:13];
        nop = 1'b0; 
	case (ctrl[4:0])
	        5'b01100: data_out = {11'h4,{ctrl[18], code},3'h1}; //I
	        5'b00100: 
                begin
                          if ({ctrl[18], code} == 4'hD) data_out = 18'h369;
                          else data_out = {12'hC,code,3'h1};
                          rs2_s0 = 5'b0;
                end
            5'b00000:// L
                begin 
                          data_out = {4'b0,code,11'h300};
                          rs2_s0 = 5'b0;
                end		
            5'b01000: data_out = {4'b0,code,11'h104};//S
            5'b11000: data_out = 18'h180;
            5'b11011: //JAL
                begin
                          data_out = 18'h782;
                          rs1_s0   = 5'b0;
                          rs2_s0   = 5'b0;
                end    
            5'b11001: //JALR
                begin
                          data_out = 18'h702;
                          rs2_s0   = 5'b0;
                end 
            5'b01101: //LUI
                begin
                          data_out = 18'h379;
                          rs1_s0   = 5'b0;
                          rs2_s0   = 5'b0;
                end 
	        5'b00101: //AUIPC
                begin
                          data_out = 18'h381;
                          rs1_s0   = 5'b0;
                          rs2_s0   = 5'b0; 
                end 
                default:data_out = 18'b0;
	    endcase
        if (Haz_rs1_s2) data_out[15:14] = 2'b10;
        if (Haz_rs2_s2) data_out[17:16] = 2'b10;
        if (opcode_s1 == 5'b0 && (Haz_rs1_s1|| Haz_rs2_s1)) nop = 1'b1;
        else if (opcode_s1 == 5'b11001||opcode_s1 == 5'b11011) 
        begin
              if (Haz_rs1_s1) data_out[15:14] = 2'b11;
              if (Haz_rs2_s1) data_out[17:16] = 2'b11;
        end 
        else
        begin
               if (Haz_rs1_s1) data_out[15:14] = 2'b01;
               if (Haz_rs2_s1) data_out[17:16] = 2'b01;
        end              
end
endmodule 
