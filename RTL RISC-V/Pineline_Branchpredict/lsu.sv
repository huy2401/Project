module lsu (clk_i, rst_ni,take_bit, addr , st_data, st_en, io_sw,
            ld_data,io_lcd,io_ledg,io_ledr,
            io_hex0, io_hex1 ,  io_hex2, io_hex3 ,io_hex4, io_hex5 ,  io_hex6, io_hex7);

input [31:0]io_sw;
input [31:0]st_data,addr;
input [2:0] take_bit; 
input clk_i, rst_ni,st_en;
output reg [31:0] ld_data,io_lcd,io_ledg,io_ledr,io_hex0, io_hex1 ,  io_hex2, io_hex3 ,io_hex4, io_hex5 ,  io_hex6, io_hex7;
wire   [8:0]address; 
logic [31:0] data [268:0]; 

assign address = (addr >   32'h500)? 9'd268 :
                 (addr ==  32'h500)? 9'd267 :
		           (addr >   32'h3ff)? (9'd256 + {5'b0,addr[7:4]}) : addr[10:2]; // address = addr / 4
					  
assign io_hex0   =   data[256]; //400h
assign io_hex1   =   data[257]; //410h
assign io_hex2   =   data[258]; //420h
assign io_hex3   =   data[259]; //430h
assign io_hex4   =   data[260]; //440h
assign io_hex5   =   data[261]; //450h
assign io_hex6   =   data[262]; //460h
assign io_hex7   =   data[263]; //470h
assign io_ledr   =   data[264]; //480h
assign io_ledg   =   data[265]; //490h 
assign io_lcd    =   data[266]; //4A0h

always @(negedge clk_i)
            if (rst_ni) 
				begin 
				     data[267] <= io_sw; // 500h
                 case ({st_en,take_bit})
                     4'b1000: data[address][7:0] <=  st_data[7:0];
                     4'b1001: data[address][15:0]<=  st_data[15:0];
                     4'b1010: data[address]<= st_data;	
                     4'b0000: ld_data <= {{24{data[address][7]}},data[address][7:0]};
                     4'b0001: ld_data <= {{16{data[address][15]}},data[address][15:0]};
                     4'b0010: ld_data <= data[address];  
                     4'b0100: ld_data <= {24'b0,data[address][7:0]};
                     4'b0101: ld_data <= {16'b0,data[address][15:0]};   
		               default  ld_data   <= 0;		
                 endcase
				 end	  
             else data <= '{default:0}; 
             //$writememh("memory/datamem.data",data);
endmodule
      
                             
 
              






 
     

     
        




