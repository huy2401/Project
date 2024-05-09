module fulladder(S, Cout, A, B, Cin,M0);
output S, Cout;
input A, B, Cin,M0;
wire S1,C1,C2;
assign S1 = A^B;
assign S = S1^Cin;
assign C1 = (M0?~A:A) & B;
assign C2 = (M0?~S1:S1) & Cin;
assign Cout = C1 | C2;
endmodule
  
module adder_8bit(S ,Cout,A ,B,Cin,M0);
output [7:0]S;
output Cout;
input  [7:0]A;
input  [7:0]B;
input  Cin,M0;
wire [6:0]C;
fulladder a1(S[0], C[0], A[0],B[0],Cin,M0);
fulladder a2(S[1], C[1], A[1],B[1],C[0],M0);
fulladder a3(S[2], C[2], A[2],B[2],C[1],M0);
fulladder a4(S[3], C[3], A[3],B[3],C[2],M0);
fulladder a5(S[4], C[4], A[4],B[4],C[3],M0);
fulladder a6(S[5], C[5], A[5],B[5],C[4],M0);
fulladder a7(S[6], C[6], A[6],B[6],C[5],M0);
fulladder a8(S[7], Cout, A[7],B[7],C[6],M0);
endmodule

module adder_24bit(S,Cout,A,B,M0);
output [23:0]S;
output Cout;
input  [23:0]A;
input  [23:0]B;
input M0;
wire C[0:1];
adder_8bit e0(S[7:0],C[0],A[7:0],B[7:0],1'b0,M0);
adder_8bit e1(S[15:8],C[1],A[15:8],B[15:8],C[0],M0);
adder_8bit e2(S[23:16],Cout,A[23:16],B[23:16],C[1],M0);
endmodule

module shiftright(out,in,shift,Cin);
output [23:0]out;
input  [23:0]in;
input  [7:0]shift;
input  Cin;
wire T;
wire [7:0]s;
wire [4:0]s0;
wire [23:0]s1[5:0];
assign s = Cin ? ~shift : shift;//ngo vao la so bu 2 thi dao nguoc tat ca cac bit
assign s1[0] = s[0]?{1'b0,in[23:1]} :in;//dich 1 bit
assign s1[1] = Cin?{1'b0,s1[0][23:1]} :s1[0];//dich them 1 bit neu ngo vao la so bu 2
assign s1[2] = s[1]?{2'b0,s1[1][23:2]} :s1[1];//dich 2 bit
assign s1[3] = s[2]?{4'b0,s1[2][23:4]} :s1[2];//dich 4 bit
assign s1[4] = s[3]?{8'b0,s1[3][23:8]} :s1[3];//dich 8 bit
assign s1[5] = s[4]?{16'b0,s1[4][23:16]} :s1[4];//dich 16 bit
assign out = (s[5] | s[6] | s[7])? 24'b0:s1[5];
endmodule


module chuanhoa(out,in, solandich,zero);
input [23:0]in;
output [22:0]out;
output [4:0]solandich;
wire [23:0]S;
output zero;
assign solandich =
	(in[23])?5'b0: //tuong tu nhu tren
	(in[22])?5'b1:
	(in[21])?5'b10:
	(in[20])?5'b11:
	(in[19])?5'b100:	
	(in[18])?5'b101:
	(in[17])?5'b110:
	(in[16])?5'b111:
	(in[15])?5'b1000:
	(in[14])?5'b1001:
	(in[13])?5'b1010:
	(in[12])?5'b1011:
	(in[11])?5'b1100:
	(in[10])?5'b1101:
	(in[9])?5'b1110:
	(in[8])?5'b1111:
	(in[7])?5'b10000:
	(in[6])?5'b10001:
	(in[5])?5'b10010:
	(in[4])?5'b10011:
	(in[3])?5'b10100:
	(in[2])?5'b10101:
	(in[1])?5'b10110:5'b10111;
assign S =
	(in[23])? in[23:0]: //tuong tu nhu tren
	(in[22])?{in[22:0], 1'b0}:
	(in[21])?{in[21:0], 2'b0}:
	(in[20])?{in[20:0], 3'b0}:
	(in[19])?{in[19:0], 4'b0}:	
	(in[18])?{in[18:0], 5'b0}:
	(in[17])?{in[17:0], 6'b0}:
	(in[16])?{in[16:0], 7'b0}:
	(in[15])?{in[15:0], 8'b0}:
	(in[14])?{in[14:0], 9'b0}:
	(in[13])?{in[13:0], 10'b0}:
	(in[12])?{in[12:0], 11'b0}:
	(in[11])?{in[11:0], 12'b0}:
	(in[10])?{in[10:0], 13'b0}:
	(in[9])?{in[9:0], 14'b0}:
	(in[8])?{in[8:0], 15'b0}:
	(in[7])?{in[7:0], 16'b0}:
	(in[6])?{in[6:0], 17'b0}:
	(in[5])?{in[5:0], 18'b0}:
	(in[4])?{in[4:0], 19'b0}:
	(in[3])?{in[3:0], 20'b0}:
	(in[2])?{in[2:0], 21'b0}:
	(in[1])?{in[1:0], 22'b0}:
        (in[0])?{in[0],23'b0}:24'b0;
assign zero = S[23];
assign out = S[22:0];
endmodule


module bu2(out,in,en);
output [23:0]out;
input  [23:0]in;
input en;//en = 1 la can lay bu 2, en = 0 giu nguyen
wire [23:0]S;
wire Cout;
adder_24bit c0(S,Cout,~in,24'b1,1'b0);//dao nguoc tat ca bit va +1
assign out = en? S : in;
endmodule

module sodacbiet(in,inf,z);//kiem tra truong hop dac biet a,b
output inf,z;
input [31:0]in;
wire [7:0]S;
wire [23:0]S0;
wire [7:0]S1;
wire C0,C1,C2;
adder_8bit g0(S,C0,in[30:23],8'hff,1'b0,1'b1);
assign inf = ~C0;// in =oo thi inf = 1
adder_24bit g1(S0,C1,{1'b0,in[22:0]},24'hffffff,1'b0);
adder_8bit  g2(S1,C2,in[30:23],8'hff,1'b0,1'b0);
assign z = C1 | C2;// in = 0 thi z= 0
endmodule

module adder(S,A,B,M);//phep cong,neu ket qua la vo cung ,M = 0 la phep cong, M = 1 la phep tru
output [31:0]S;
input M;
wire overflow;
input [31:0]A,B;
wire [7:0]S1,S3;
wire [23:0]S2,S4,S5,A0,A1,B1;
wire C0,C1,C2,M0,za,zb,zs,zero,B0;
wire [7:0]S6;
wire [30:0]S7;
wire [30:0]S8;
wire [4:0]dich;
sodacbiet f0(A,infa,za);
sodacbiet f1(B,infb,zb);
adder_8bit d0(S1,C0,A[30:23],B[30:23],1'b0,1'b1);//Tru 2 phan mu cua A,B
assign B0 = M? ~B[31] : B[31];
// neu la phep tru thi doi dau B de chuyen thanh phep cong
assign A0[22:0] = C0 ? A[22:0] : B[22:0]; //A0 la so nho hon
assign B1[22:0] = C0 ? B[22:0] : A[22:0];// B0 la so lon hon
assign A0[23] = 1'b1; //Them bit 1
assign B1[23] = 1'b1;
assign S3 = C0 ? B[30:23] : A[30:23];
//chon phan mu lon hon
shiftright d1(A1,A0,S1,C0);// dich phai so nho hon
assign M0 =A[31]^B0;
//M0 =0 A,B cung dau thuc hien cong
//M0 =1 A,B khac dau thuc hien tru
adder_24bit d2(S2,C1,B1,A1,M0);
bu2 d3(S4,S2,M0 & C1);// lay bu neu do la phep tru va C1 = 1
assign S5 = (M0? 0:C1)? {1'b1,S4[23:1]}:S4;
//neu la phep tru hoac cong ko nho thi giu nguyen S5=S4
//neu la phep cong co nho thi dich tat ca cac bit sang phai 1 bit va them bit 1
adder_8bit d5(S6,overflow,S3,8'b0,C1,1'b0);
//neu co nho thi phan mu cong them 1
chuanhoa d6(S7[22:0],S5,dich,zero);
//dich bit sang trai ve dang chuan hoa
//zero = 0 thi ket qua cuoi cung la 0
adder_8bit d7(S7[30:23],C2,S6,{3'b0,dich},1'b0,1'b1);
//phan mu tru di so bit dich sang trai
//C2 = 1 tuc la ket qua cuoi cung la 0

assign zs = (infa&&infb&&M0)|~zero|C2 ;
//a , b deu la vo cung va khac dau nhau, ket qua la 0
//zs = 1 ket qua cuoi cung la 0,zs = 0 ket qua khac 0
assign S[31] =zs? 0 : (C0 ^C1)? B0 : A[31];
//cung dau thi theo dau A hay B deu dung
//khac dau thi S se lay dau so co phan nguyen lon hon
//ket qua la 0 thi lay dau +
assign S8 = ((infa || infb||overflow) & ~zs)?31'h7f800000:S7;
assign S[30:0] = zs? 31'b0 : S8;
endmodule


module muti(S,A,B);
output[31:0]S;
input [31:0]A,B;
wire [7:0]S0;
wire C0,C1;
wire [23:0]out[23:0];
wire [23:0]Cout;
wire [23:0]A0,B0;
wire [30:0]Sout;
sodacbiet m0(A,infa,za);
sodacbiet m1(B,infb,zb);
assign A0 = {1'b1,A[22:0]};
assign B0 = {1'b1,B[22:0]};
assign out[0] = B0[0] ? A0[23:0] : 24'b0; 
assign Cout[0] = 1'b0;
adder_24bit mu0 (out[1],Cout[1],B0[1] ? A0[23:0] :24'b0,{Cout[0],out[0][23:1]},1'b0);
adder_24bit mu1 (out[2],Cout[2],B0[2] ? A0[23:0] :24'b0,{Cout[1],out[1][23:1]},1'b0);
adder_24bit mu2 (out[3],Cout[3],B0[3] ? A0[23:0] :24'b0,{Cout[2],out[2][23:1]},1'b0);
adder_24bit mu3 (out[4],Cout[4],B0[4] ? A0[23:0] :24'b0,{Cout[3],out[3][23:1]},1'b0);
adder_24bit mu4 (out[5],Cout[5],B0[5] ? A0[23:0] :24'b0,{Cout[4],out[4][23:1]},1'b0);
adder_24bit mu5 (out[6],Cout[6],B0[6] ? A0[23:0] :24'b0,{Cout[5],out[5][23:1]},1'b0);
adder_24bit mu6 (out[7],Cout[7],B0[7] ? A0[23:0] :24'b0,{Cout[6],out[6][23:1]},1'b0);
adder_24bit mu7 (out[8],Cout[8],B0[8] ? A0[23:0] :24'b0,{Cout[7],out[7][23:1]},1'b0);
adder_24bit mu8 (out[9],Cout[9],B0[9] ? A0[23:0] :24'b0,{Cout[8],out[8][23:1]},1'b0);
adder_24bit mu9 (out[10],Cout[10],B0[10] ? A0[23:0] :24'b0,{Cout[9],out[9][23:1]},1'b0);
adder_24bit mu10 (out[11],Cout[11],B0[11] ? A0[23:0] :24'b0,{Cout[10],out[10][23:1]},1'b0);
adder_24bit mu11 (out[12],Cout[12],B0[12] ? A0[23:0] :24'b0,{Cout[11],out[11][23:1]},1'b0);
adder_24bit mu12 (out[13],Cout[13],B0[13] ? A0[23:0] :24'b0,{Cout[12],out[12][23:1]},1'b0);
adder_24bit mu13 (out[14],Cout[14],B0[14] ? A0[23:0] :24'b0,{Cout[13],out[13][23:1]},1'b0);
adder_24bit mu14 (out[15],Cout[15],B0[15] ? A0[23:0] :24'b0,{Cout[14],out[14][23:1]},1'b0);
adder_24bit mu15 (out[16],Cout[16],B0[16] ? A0[23:0] :24'b0,{Cout[15],out[15][23:1]},1'b0);
adder_24bit mu16 (out[17],Cout[17],B0[17] ? A0[23:0] :24'b0,{Cout[16],out[16][23:1]},1'b0);
adder_24bit mu17 (out[18],Cout[18],B0[18] ? A0[23:0] :24'b0,{Cout[17],out[17][23:1]},1'b0);
adder_24bit mu18 (out[19],Cout[19],B0[19] ? A0[23:0] :24'b0,{Cout[18],out[18][23:1]},1'b0);
adder_24bit mu19 (out[20],Cout[20],B0[20] ? A0[23:0] :24'b0,{Cout[19],out[19][23:1]},1'b0);
adder_24bit mu20 (out[21],Cout[21],B0[21] ? A0[23:0] :24'b0,{Cout[20],out[20][23:1]},1'b0);
adder_24bit mu21 (out[22],Cout[22],B0[22] ? A0[23:0] :24'b0,{Cout[21],out[21][23:1]},1'b0);
adder_24bit mu22 (out[23],Cout[23],B0[23] ? A0[23:0] :24'b0,{Cout[22],out[22][23:1]},1'b0);
assign Sout[22:0] = Cout[23]? out[23][23:1] : out[23][22:0];
//ket qua phep cong co nho, neu cout[23] = 1 thi dich tat ca cac bit sang phai 1 bit,dua ve chuan hoa
adder_8bit m2(S0,C0,A[30:23],8'h7f,1'b0,1'b1);
adder_8bit m3(Sout[30:23],C1,S0,B[30:23],Cout[23],1'b0);
//so mu s = so mu a + so mu b -127 + Cout[23]
assign overflow = C0? 0: C1;
//C0 = 0, C1 = 1 thi phep cong phan mu bi tran
assign zs = (C0?C1:1);
//C0 = 1, C1 = 0 thi phep cong phan mu qua nho
//zs =0 thi ket qua bang 0
assign S[31] =(za&zb&zs)? A[31] ^ B[31]: 0;
assign S[30:0] = ~(zs&za&zb) ? 31'b0: //a hoac b =0 thi ket qua la 0
                 (infa|infb|overflow)?31'h7f800000:Sout;// a hoac b = inf, hoac tran thi ket qua la inf
                           
endmodule

module adder_25bit(S,Cout,A,B);
output [24:0]S;
output Cout;
input [24:0]A;
input [24:0]B;
wire [24:0]S0;
adder_24bit m0(S0[23:0],C0,A[23:0],B[23:0],1'b1);
fulladder m1(S0[24],Cout,A[24],B[24],C0,1'b1);
assign S = Cout ? A : S0;
// A > B thi S=S0 , A < B thi S = A
endmodule

module div(S,A,B); // chia 0 ket qua bang oo
output [31:0]S;
input [31:0]A,B;
wire [7:0]S0;
wire [24:0]out[23:0];
wire [23:0]S2,Cout;
wire [30:0]Sout;
wire C0,C1,za,zb,zs,z1;
wire [24:0]A0,B0;
sodacbiet q2(A,infa,za);
sodacbiet q3(B,infb,zb);
assign A0 = {2'b01,A[22:0]};
assign B0 = {2'b01,B[22:0]};
adder_25bit di0(out[0],Cout[23],A0,B0); 
adder_25bit di1(out[1],Cout[22],{out[0][23:0],1'b0},B0);
adder_25bit di2(out[2],Cout[21],{out[1][23:0],1'b0},B0);
adder_25bit di3(out[3],Cout[20],{out[2][23:0],1'b0},B0);
adder_25bit di4(out[4],Cout[19],{out[3][23:0],1'b0},B0);
adder_25bit di5(out[5],Cout[18],{out[4][23:0],1'b0},B0);
adder_25bit di6(out[6],Cout[17],{out[5][23:0],1'b0},B0);
adder_25bit di7(out[7],Cout[16],{out[6][23:0],1'b0},B0);
adder_25bit di8(out[8],Cout[15],{out[7][23:0],1'b0},B0);
adder_25bit di9(out[9],Cout[14],{out[8][23:0],1'b0},B0);
adder_25bit di10(out[10],Cout[13],{out[9][23:0],1'b0},B0);
adder_25bit di11(out[11],Cout[12],{out[10][23:0],1'b0},B0);
adder_25bit di12(out[12],Cout[11],{out[11][23:0],1'b0},B0);
adder_25bit di13(out[13],Cout[10],{out[12][23:0],1'b0},B0);
adder_25bit di14(out[14],Cout[9],{out[13][23:0],1'b0},B0);
adder_25bit di15(out[15],Cout[8],{out[14][23:0],1'b0},B0);
adder_25bit di16(out[16],Cout[7],{out[15][23:0],1'b0},B0);
adder_25bit di17(out[17],Cout[6],{out[16][23:0],1'b0},B0);
adder_25bit di18(out[18],Cout[5],{out[17][23:0],1'b0},B0);
adder_25bit di19(out[19],Cout[4],{out[18][23:0],1'b0},B0);
adder_25bit di20(out[20],Cout[3],{out[19][23:0],1'b0},B0);
adder_25bit di21(out[21],Cout[2],{out[20][23:0],1'b0},B0);
adder_25bit di22(out[22],Cout[1],{out[21][23:0],1'b0},B0);
adder_25bit di23(out[23],Cout[0],{out[22][23:0],1'b0},B0);
assign S2 = ~Cout;
 //ket qua phep chia la nghich dao tat ca cac bit Cout
adder_8bit q0(S0,C0,A[30:23],8'h7f,1'b0,1'b0);
adder_8bit q1(Sout[30:23],C1,S0,B[30:23],Cout[23],1'b1);
//so mu s = so mu a - so mu b +127 - Cout[23]
assign Sout[22:0] =S2[23]? S2[22:0]: {S2[21:0],1'b0};
//dua ve dang chuan hoa
assign z1 = infa && infb;//2 so vo cung chia nhau , ket qua la 1
assign overflow =~(zb & ( C0? C1:1));
//C0 = 1 , C1 = 0, phan mu s bi tran , ket qua oo 
//zb = 0 ket qua la oo
assign zs = ~((za|~zb) & (C0 ? 1:~C1)& ~infb); 
//C0 = 0, C1 = 1, phan mu s qua nho, ket qua la 0
//zs = 1 ket qua la 0
//za = zb = 0 thi ket qua la oo
//infb =oo thi ket qua la 0
assign S[31] = zs? A[31]^B[31] :0;
//zs =0 thi S dau +
//A,B khac dau thi S la dau -, A,B cung dau S la dau +
assign S[30:0] = z1? 31'h3f000000:
                 zs? 31'b0: 
                 overflow?31'h7f800000:Sout;
endmodule

module chialuythua(S,Sin,A,B); //S = Sin /A^B
output [31:0]S;
input [31:0]Sin,A;
input [7:0]B;
wire [31:0]S0[7:1];
wire [31:0]S1[6:0];
wire [31:0]S2;
muti m1(S0[1],A,A);// A^2
muti m2(S0[2],S0[1],S0[1]);//A^4
muti m3(S0[3],S0[2],S0[2]);//A^8
muti m4(S0[4],S0[3],S0[3]);//A^16
muti m5(S0[5],S0[4],S0[4]);//A^32
muti m6(S0[6],S0[5],S0[5]);//A^64
muti m7(S0[7],S0[6],S0[6]);//A^128

assign S2 = 32'h3f800000;// S2 = 1;
div a0(S1[0],Sin,B[0]? A : S2);
div a1(S1[1],S1[0],B[1]? S0[1] : S2);
div a2(S1[2],S1[1],B[2]? S0[2] : S2);
div a3(S1[3],S1[2],B[3]? S0[3] : S2);
div a4(S1[4],S1[3],B[4]? S0[4] : S2);
div a5(S1[5],S1[4],B[5]? S0[5] : S2);
div a6(S1[6],S1[5],B[6]? S0[6] : S2);
div a7(S,    S1[6],B[7]? S0[7] : S2);
endmodule

module fl32bit(S,n);// chuyen n 8 bit thanh 32 bit floating point
output[31:0] S; 
input [7:0]n; 
wire  [4:0]dich;
wire C0;
assign S[31] = 0;
chuanhoa   v0 (S[22:0],{n,16'b0},dich,zero);
adder_8bit v1 (S[30:23],C0,8'h86,{3'b0,dich},1'b0,1'b1);
endmodule

module canbacn(S,A,n,clk,i);
output reg[31:0]S;
input clk;
input [31:0]A;
input [7:0]n;
output i;
reg   [31:0]S7;
wire  [7:0]n0;
wire [31:0]B0,B1,A0;
wire [31:0]S1,S2,S3,S4,S5;
wire C0,inf,zero;
//cong thuc de quy S = (A/S^(n-1) + (n-1)S)/n voi S ban dau tuy chon
assign i = A[31] ? (!n[0]) : 0; // Xuat hien phan ao khi A < 0 va n la so chan
assign A0 = i? {1'b0,A[30:0]}:A; //chuyen ve dau + neu xuat hien phan ao
adder_8bit m0(n0,C0,n,8'b0,1'b1,1'b1);// n -1
fl32bit    m1(B0,n0);// n -1
fl32bit    m2(B1,n);//  n
muti       m3(S1,S,B0);// S1 = (n-1)S
chialuythua m4(S2,A,S,n0);//S2 = A / S ^ (n -1)
adder      m6(S3,S2,S1,1'b0); //S3 = S1 +S2
div        m7(S4,S3,B1);//S4 = S3 / n
muti       m8(S5,S7,32'h40000000); // S5 = S7 x 2, tim S ban dau thoa S ^ (n-1) ko bi tran 
sodacbiet  m11(S2,inf,zero); // kiem tra xem S2 co phai 0 ko
always @(clk) // clock tan so cang cao ket qua cang chinh xac
if (!zero) //S2 = A / S ^ (n-1) phai khac 0, neu bang 0 chon S moi
begin
      S <= S7 ;//S ban dau ko thoa man S2 khac 0,Gan gia tri S ban dau moi 
      S7 <= S5;//tang S ban sau x 2
end  
else S <= S4; 

always @(A or n)//du lieu vao thay doi thi reset du lieu
begin
      S  <= 32'h3f800000;// S ban dau chon =1;
      S7 <= 32'h3fb501ee;// S ke tiep chon can 2
end
endmodule

module adder_4bit(S,Cout,A,B,M0);
output [3:0]S;
input  [3:0]A,B;
input M0;
output Cout;
wire [2:0]C;
fulladder a1(S[0], C[0], A[0],B[0],1'b0,M0);
fulladder a2(S[1], C[1], A[1],B[1],C[0],M0);
fulladder a3(S[2], C[2], A[2],B[2],C[1],M0);
fulladder a4(S[3], Cout, A[3],B[3],C[2],M0);
endmodule


module ss(S,A);//A>=5 thi S = A+3, A<5 thi S = A
output [3:0]S;
input [3:0]A;
assign C0 = A[3]|(A[2] & (A[1] | A[0]));//C0 = 1 thi a>=5
adder_4bit a0(S,C1,A,C0? 4'h3:4'b0,1'b0);
assign Cout = A[3]&A[2]&A[1]&A[0];
endmodule
 
module phannguyen(S,A,solandich,clk,somu10); //chuyen nhi phan thanh BCD
output reg[31:0]S;
output reg [7:0]somu10;
input [23:0]A;
input clk;
input [7:0]solandich;
reg   [23:0]in;
reg   [7:0]dich;
wire  [7:0]dem1,dem2;
wire  [31:0]S1;
wire  C0,C2;
 
ss m0(S1[31:28],S[31:28]); 
ss m1(S1[27:24],S[27:24]); 
ss m2(S1[23:20],S[23:20]); 
ss m3(S1[19:16],S[19:16]); 
ss m4(S1[15:12],S[15:12]); 
ss m5(S1[11:8] ,S[11:8]); 
ss m6(S1[7:4]  ,S[7:4]); 
ss m7(S1[3:0]  ,S[3:0]);
// kiem tra cac nhom 4 bit, neu > 5 thi +3,neu < 5 thi giu nguyen
adder_8bit m8(dem1,C0,dich,8'b0,1'b1,1'b1); //solandich -1
adder_8bit m10(dem2,C2,somu10,8'b0,S1[31],1'b0); //dem so mu

always @(clk)
begin
     if (!C0) //dich > 0
     begin
       dich <= dem1;   
       if (S1[31]) S <= {3'b0,S1[31:4],in[23]}; 
       else S <= {S1[30:0],in[23]};
       in  <={in[22:0],1'b0};
       somu10 <=dem2;
     end
end    

always @(A or solandich) //du lieu vao thay doi
begin
       S <= 31'b0;
       in   <= A;
       dich <= solandich;
       somu10<=8'h07;//phai dam bao du lieu vao A>10^8
end 
endmodule


module chuyen(S,A,somu0,somu10);// x10 cho den khi S > 10 ^8
output [31:0]S;
output [7:0]somu10; //so lan x10
input  [7:0]somu0;
input  [31:0]A;
wire   [31:0]S1,S0;
wire   C0;
adder m0(S1,A,32'h4b18967f,1'b1);//S1 = A - 10^8 - 1
muti  m1(S0,A,32'h41200000);//S0=Ax10
adder_8bit m2(somu10,C0,somu0,8'b0,S1[31],1'b0);//dem so lan x10
assign S = S1[31]?S0:A; // A < 10 ^8 thi S = A x10, A>=A^8 thi S = A
endmodule


module float_to_deximal(Dau,S,Dausm10,sm10,A,clk); //Chuyen 32 bit floating point thanh he thap phan
//Dau =0 S = 32'h12345678 Dausm10 = 1 , sm10 = 15  thi ket qua la 1.2345678 x 10 ^ -15 
output Dau;
output [31:0]S;
output Dausm10;
output reg[7:0]sm10;//so mu 10
input  [31:0]A;
input clk;
reg    [7:0]sm;//dem so lan x10 cho den khi A>10^8
wire   [7:0]solandich;
wire   [7:0]sm0,sm1,sm2,sm3,sm4,sm6,dem1;
reg    [7:0]sm5,dich;
reg    [31:0]A0;
wire   [31:0]A1;
wire   C0,C1; 

assign      Dau = A[31];
chuyen      a0(A1,A0,sm,sm0);//x10 cho den khi A1 >10 ^ 8 
adder_8bit  a1(solandich,C0,A1[30:23],8'h7e,1'b0,1'b1);// so lan dich = phan mu - 126
phannguyen  a2(S,{1'b1,A1[22:0]},solandich,clk,sm1);//chuyen so nhi phan 24 bit thanh BCD 8 so
//phan mu 10 sm10 = sm1 - sm0(so lan x10)
adder_8bit  a3(sm2,Dausm10,sm1,sm0,1'b0,1'b1);
adder_8bit  a4(sm3,C1,~sm2,8'b0,1'b1,1'b0); // lay bu 2
assign sm4 = Dausm10? sm3 : sm2;//phan mu 10 dang so hex
//chuyen sm4 sang so thap phan 
ss a5(sm6[7:4] ,sm10[7:4]); 
ss a6(sm6[3:0] ,sm10[3:0]);
adder_8bit m8(dem1,C2,dich,8'b0,1'b1,1'b1);

always @(clk)
begin 
     A0 <=A1;
     sm <=sm0;
     if (!C2) 
     begin
          sm10 <= {sm6[6:0],sm5[7]}; 
          dich <= dem1;
          sm5  <= {sm5[6:0],1'b0};
     end
end

always @(sm4) 
begin  
   sm5<=sm4; 
   dich<=8'h08;
   sm10 <=8'b0; 
end

always @(A)
begin
   A0 <=A;
   sm <=8'b0;
end     
     
endmodule
 







