module singlecycle
//import mypkg::*;
(                  
                   input logic [31:0]io_sw_i,
                   output logic [31:0]io_lcd_o,
                   output logic [31:0]io_ledg_o,
                   output logic [31:0]io_ledr_o,
                   output logic [31:0]io_hex0_o, 
                   output logic [31:0]io_hex1_o,  
                   output logic [31:0]io_hex2_o,
                   output logic [31:0]io_hex3_o,
                   output logic [31:0]io_hex4_o, 
                   output logic [31:0]io_hex5_o, 
                   output logic [31:0]io_hex6_o, 
                   output logic [31:0]io_hex7_o,
                   input  logic clk_i, 
                   input  logic rst_ni 
);

/////S0
wire [31:0] pc_i;
wire [31:0] nxt_pc_i,nxt_pc_o,pc_o;
wire [31:0] pc_four_i,pc_four_o ,instr_i,instr_o;
wire nop_i,nop_o,nop_s1_i,reset_o;
wire [17:0] data_o,data_i;
wire [18:0] ctrl_i;
/////S1
wire[31:0] imm_s1_i ,imm_s1_o ,pc_s1_i,pc_s1_o,
           rs1_data_s1_o,rs2_data_s1_o,rs1_data_s1_i,rs2_data_s1_i,
           instr_s1_o,instr_s1_i;
wire [4:0] rd_addr_s1_i,rs1_addr_s1_i,rs2_addr_s1_i;
wire rd_wren_s1_i;
wire [17:0] data_s1_i,data_s1_o;
//////S2
wire br_sel_s2_i,br_sel_s2_o,rd_wren_s2_i,mem_wren_s2_i,op_a_sel_s2_i,op_b_sel_s2_i;
wire [1:0]wb_sel_s2_i;
wire [2:0]take_bit_s2_i;
wire [3:0]alu_op_s2_i;
wire [4:0]rd_addr_s2_i ,rd_addr_s2_o;
wire [7:0]brcomp_s1_i,brcomp_s2_i,brcomp_s2_o;
wire [31:0]pc_s2_i , pc_s2_o , imm_s2_i , imm_s2_o,rs1_data_s2_i , rs1_data_s2_o,
           rs2_data_s2_i , rs2_data_s2_o, alumux1_s2_i , alumux1_s2_o , 
           alumux2_s2_i , alumux2_s2_o, alu_data_s2_i,alu_data_s2_o,rs1_data_i,rs2_data_i,
           pc_four_s2_i,pc_four_s2_o;
wire [17:0] data_s2_o;

//////////S3

wire rd_wren_s3_i,rd_wren_s3_o, mem_wren_s3_i,mem_wren_s3_o;
wire [1:0] wb_sel_s3_i,wb_sel_s3_o;
wire [2:0] take_bit_s3_i,take_bit_s3_o;
wire [4:0] rd_addr_s3_i ,rd_addr_s3_o;
wire [31:0] pc_four_s3_i,pc_four_s3_o,alu_data_s3_i,alu_data_s3_o,
            rs2_data_s3_i , rs2_data_s3_o,ld_data_s3_i,ld_data_s3_o;
wire [31:0] wb_data_s3_i , wb_data_s3_o ;

////////////S4
wire rd_wren_s4_i,rd_wren_s4_o;
wire [4:0] rd_addr_s4_i,rd_addr_s4_o; 
wire [31:0] wb_data_s4_i , wb_data_s4_o ;
//////////////////////

assign pc_i = pc_o;
assign nxt_pc_i = nxt_pc_o;
assign instr_i = instr_o;
assign pc_four_i = pc_four_o;
assign nop_i = (reset_o) ? 1'b0 : nop_o;
assign nop_s1_i = nop_o || reset_o;
assign ctrl_i = {instr_o[30],instr_o[24:15],instr_o[14:12],instr_o[6:2]}; 
assign data_i = data_o;

branchpredict  BR
(
                        .clk_i(clk_i),
                        .rst_ni(rst_ni), 
                        .pc_s0_i(pc_o[9:2]),
                        .opcode_s0(instr_i[6:2]),
                        .opcode_s2(brcomp_s2_i[4:0]),
                        .pc_s2_i(pc_s2_i[9:2]),
                        .pc_s2_j(alu_data_s2_i[12:2]),
                        .pc_four_s0(pc_four_i),
                        .pc_four_s2(pc_four_s2_i),
                        .br_sel_s2(br_sel_s2_o),
    
                        .reset(reset_o),
                        .nxt_pc(nxt_pc_o)	
);

pc 	        PC   (      
                        .clk_i(clk_i), 
                        .rst_ni(rst_ni),
                        .nop_i(nop_i),
                        .nxt_pc(nxt_pc_i),
                        .pc_o(pc_o));

add_4	    ADD (       .pc_i(pc_i), 
                        .pc_four(pc_four_o));

instmem	    IMem(       .pc_i(pc_i[12:2]), 
                        .instr(instr_o));


control     CTRL(   
                        .ctrl(ctrl_i),
                        .rd_s1(rd_addr_s1_i),
                        .rd_s2(rd_addr_s2_i),
                        .rd_wren_s1(rd_wren_s1_i), 
                        .rd_wren_s2(rd_wren_s2_i),
                        .opcode_s1(instr_s1_i[6:2]),
                        .nop(nop_o),    
       	                .data_out(data_o)
       	         );



pipelinestage1 S1(
                        .clk_i(clk_i),
                        .nop_i(nop_s1_i),
                        .rst_ni(rst_ni),  
                        .pc_i(pc_o),
                        .instr_i(instr_i),
                        .ctrl_i(data_i),

                        .pc_o(pc_s1_o),
                        .instr_o(instr_s1_o),
                        .ctrl_o(data_s1_o)
                );
///////////////////////////////////



assign rs1_addr_s1_i  = instr_s1_o[19:15];
assign rs2_addr_s1_i =  instr_s1_o[24:20];
assign rd_addr_s1_i = instr_s1_o[11:7];
assign instr_s1_i = instr_s1_o;
assign imm_s1_i = imm_s1_o;
assign rd_wren_s1_i = data_s1_o[9]; 
assign data_s1_i = data_s1_o;
assign rs1_data_s1_i = rs1_data_s1_o;
assign rs2_data_s1_i = rs2_data_s1_o;
assign pc_s1_i = pc_s1_o;
assign brcomp_s1_i = {instr_s1_o[14:12],instr_s1_o[6:2]}; 

regfile     RegFile(
                        .clk_i(clk_i),
                        .rst_ni(rst_ni), 
                        .rd_wren(rd_wren_s4_i),
                        .rs1_addr(rs1_addr_s1_i),
    	                .rs2_addr(rs2_addr_s1_i),
    	                .rd_addr(rd_addr_s4_i),
                        .rd_data(wb_data_s4_i),
                        .rs1_data(rs1_data_s1_o),
    	                .rs2_data(rs2_data_s1_o)
               );

immgen	    ImmGen(     .instr(instr_s1_i), 
                        .imm(imm_s1_o)
               );

pipelinestage2 S2
(
                        .clk_i(clk_i),
                        .rst_ni(rst_ni),
                        .nop_i(reset_o),
                        .rd_addr_i(rd_addr_s1_i),
                        .brcomp_i(brcomp_s1_i),
                        .ctrl_i(data_s1_i),
                        .rs1_data_i(rs1_data_s1_i),
                        .rs2_data_i(rs2_data_s1_i),
                        .imm_i(imm_s1_i),
                        .pc_i (pc_s1_i),
 
                        .rd_addr_o(rd_addr_s2_o),
                        .brcomp_o(brcomp_s2_o),
                        .ctrl_o(data_s2_o),
                        .rs1_data_o(rs1_data_s2_o),
                        .rs2_data_o(rs2_data_s2_o),
                        .imm_o(imm_s2_o),
                        .pc_o(pc_s2_o)
);
////////////////////////////////


wire [1:0] rs1_sel_i,rs2_sel_i;

assign rs1_sel_i = data_s2_o[15:14];
assign rs2_sel_i = data_s2_o[17:16];
assign take_bit_s2_i =    data_s2_o[13:11];
assign br_sel_s2_i =      data_s2_o[10];
assign rd_wren_s2_i =     data_s2_o[9];
assign op_b_sel_s2_i =    data_s2_o[8];
assign op_a_sel_s2_i =    data_s2_o[7];
assign alu_op_s2_i =      data_s2_o[6:3];
assign mem_wren_s2_i =    data_s2_o[2];
assign wb_sel_s2_i =      data_s2_o[1:0];
assign pc_s2_i  = pc_s2_o;
assign imm_s2_i = imm_s2_o;
assign rs1_data_s2_i = rs1_data_s2_o;
assign rs2_data_s2_i = rs2_data_s2_o;
assign pc_four_s2_i = pc_four_s2_o;
assign rd_addr_s2_i  = rd_addr_s2_o;
assign brcomp_s2_i = brcomp_s2_o;
assign alumux1_s2_i = alumux1_s2_o;
assign alumux2_s2_i = alumux2_s2_o;
assign alu_data_s2_i = alu_data_s2_o;


mux3        Rs1    (
                        .out(rs1_data_i),
                        .in0(rs1_data_s2_i),
                        .in1(alu_data_s3_i),
                        .in2(wb_data_s4_i),
                        .in3(pc_four_s3_i),
                        .sel(rs1_sel_i)
                   );

mux3        Rs2    (
                        .out(rs2_data_i),
                        .in0(rs2_data_s2_i),
                        .in1(alu_data_s3_i),
                        .in2(wb_data_s4_i),
                        .in3(pc_four_s3_i),
                        .sel(rs2_sel_i)
                    );
  
brcomp      BrComp(   
                        .rs1_data(rs1_data_i), 
                        .rs2_data(rs2_data_i), 
                        .brcomp_i(brcomp_s2_i),
                        .br_sel_i(br_sel_s2_i),
                        .br_sel_o(br_sel_s2_o)
                  );

mux2        ALUmux1(    .out(alumux1_s2_o), 
                        .in0(rs1_data_i), 
                        .in1(pc_s2_i), 
                        .sel(op_a_sel_s2_i)
                   );

mux2	    ALUmux2(    .out(alumux2_s2_o), 
                        .in0(rs2_data_i), 
                        .in1(imm_s2_i),
                        .sel(op_b_sel_s2_i)
                   );

alu	        ALU(    
                        .alu_op   (alu_op_s2_i), 
                        .operand_a(alumux1_s2_i), 
                        .operand_b(alumux2_s2_i), 
                        .alu_data (alu_data_s2_o)
                   );

add_4	    ADD2 (       .pc_i(pc_s2_i), 
                         .pc_four(pc_four_s2_o));
                         
pipelinestage3  S3
(
                        .clk_i(clk_i),
                        .rst_ni(rst_ni),
                        .pc_four_i(pc_four_s2_i),
                        .alu_data_i(alu_data_s2_i),
                        .rd_addr_i(rd_addr_s2_i),
                        .rd_wren_i(rd_wren_s2_i),   
                        .mem_wren_i(mem_wren_s2_i),
                        .wb_sel_i(wb_sel_s2_i),
                        .take_bit_i(take_bit_s2_i),
                        .rs2_data_i(rs2_data_i),
                
                        .pc_four_o(pc_four_s3_o),
                        .alu_data_o(alu_data_s3_o),
                        .rd_addr_o(rd_addr_s3_o),
                        .rd_wren_o(rd_wren_s3_o),
                        .mem_wren_o(mem_wren_s3_o),
                        .wb_sel_o(wb_sel_s3_o),
                        .take_bit_o(take_bit_s3_o),
                        .rs2_data_o(rs2_data_s3_o)
);
///////////////////////////////////////////////////



assign pc_four_s3_i  = pc_four_s3_o;
assign rd_addr_s3_i  = rd_addr_s3_o;
assign rd_wren_s3_i  = rd_wren_s3_o;
assign alu_data_s3_i = alu_data_s3_o;
assign mem_wren_s3_i = mem_wren_s3_o;
assign take_bit_s3_i = take_bit_s3_o;
assign rs2_data_s3_i = rs2_data_s3_o;
assign ld_data_s3_i  = ld_data_s3_o;
assign wb_sel_s3_i   = wb_sel_s3_o;



lsu     LSU(            .clk_i(clk_i), 
                        .rst_ni(rst_ni),
                        .take_bit(take_bit_s3_i), 
                        .addr (alu_data_s3_i), 
                        .st_data(rs2_data_s3_i), 
                        .st_en(mem_wren_s3_i), 
                        .io_sw(io_sw_i),
                        .ld_data(ld_data_s3_o),
                        .io_lcd(io_lcd_o),
                        .io_ledg(io_ledg_o),
                        .io_ledr(io_ledr_o),
                        .io_hex0(io_hex0_o), 
                        .io_hex1(io_hex1_o),  
                        .io_hex2(io_hex2_o),
                        .io_hex3(io_hex3_o),
                        .io_hex4(io_hex4_o), 
                        .io_hex5(io_hex5_o), 
                        .io_hex6(io_hex6_o), 
                        .io_hex7(io_hex7_o));

wbmux	WBMux(          
                        .wb_data(wb_data_s3_o), 
                        .ld_data(ld_data_s3_i), 
                        .alu_data(alu_data_s3_i), 
                        .pc_four(pc_four_s3_i), 
                        .wb_sel(wb_sel_s3_i)
             );
////////////////////////////////////////

assign rd_wren_s4_i = rd_wren_s4_o; 
assign rd_addr_s4_i = rd_addr_s4_o;
assign wb_data_s3_i = wb_data_s3_o;
assign wb_data_s4_i = wb_data_s4_o; 

pipelinestage4 S4
(
                        .clk_i(clk_i),
                        .rst_ni(rst_ni),
                        .rd_wren_i(rd_wren_s3_i), 
                        .rd_addr_i(rd_addr_s3_i), 
                        .wb_data_i(wb_data_s3_i),    
                        .rd_wren_o(rd_wren_s4_o), 
                        .rd_addr_o(rd_addr_s4_o),
                        .wb_data_o(wb_data_s4_o)  
);

endmodule
