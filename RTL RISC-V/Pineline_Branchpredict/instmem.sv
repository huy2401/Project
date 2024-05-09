module instmem(pc_i,instr);
//pc_in = pc_o[12:2];
input [10:0]pc_i;
output reg [31:0]instr;
reg    [31:0]IMEM[0:1500];

initial
$readmemh("E:/Quatus/projects/CTMT/memory/instmem.data.kit",IMEM);
assign instr = IMEM[pc_i];
             
endmodule
