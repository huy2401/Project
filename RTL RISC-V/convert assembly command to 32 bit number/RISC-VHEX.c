#include <stdio.h>
#include <string.h>
#include <math.h>

char hex[20];
char bin[34];
char RISC[20];
char HEX[18] =   "0123456789ABCDEF";
char BIN[][17] =   {"0000","0001","0010","0011",
                      "0100","0101","0110","0111",
                      "1000","1001","1010","1011",
                      "1100","1101","1110","1111"} ;
char immhex[17];

int HexToBin() 
{    
     strupr(hex);
     strcpy(bin,""); 
     for (int i = 0 ; i  < 8  ; i++)
     for (int j = 0 ; j  < 16 ; j++)
     if (hex[i] == HEX[j]) strcat(bin,BIN[j]);
}

int dex(int d,int dau, int cuoi)
{
    int B = 31 - dau;
    int E = 31 - cuoi; 
    int Tong = 0;
    for (int i = B; i <= E;i++)
    if ((d == 0) && (bin[i] == '1')) Tong += pow(2,E-i);
    else if ((d == 1) && (bin[i] == '0')) Tong +=pow(2,E-i);
    if (d == 1) Tong = -Tong; 
    return Tong;
}

int hexconvert(long long dex)
{
     int kt,hex,i = 0;
     strcpy(immhex,"0x");
     char so[10] ="0";
     if (dex < 0) dex = 1294967295;
    // printf("%d\n",dex);
     while (dex > 0)
     {
         hex = dex % 16;
         dex = dex / 16;
         so[i] = HEX[hex];
         i++; 
     }
     strrev(so);
     strcat(immhex,so);
      
}

int main(void)
{
    FILE * fp0;
    FILE * fp1;
    //Mở file bằn hàm fopen
    fp0= fopen("Hex.txt", "r");
    fp1= fopen("Bin.txt", "w");
    //Đọc dòng 1
      while(fgets(hex,20,fp0) != NULL)
    {   
      HexToBin(); 
      int rs1 = dex(0,19,15);
      int rs2 = dex(0,24,20);
      int rd  = dex(0,11,7);
      int opcode0 = dex(0,6,2);
      int opcode1 = dex(0,14,12);
      long imm;
      int d = bin[0] - 48;
      switch (opcode0)
      {
      case 24:
              switch (opcode1)
              {
              case 0:
                strcpy(RISC,"BEQ ");
                break;
              case 1:
                strcpy(RISC,"BNE ");
                break;
              case 4:
                strcpy(RISC,"BLT ");
                break;
              case 5:
                strcpy(RISC,"BGE ");
                break;
              case 6:
                strcpy(RISC,"BLTU");
                break;
              case 7: 
                strcpy(RISC,"BGEU"); 
                break; 
              default:strcpy(RISC,"????");
                break;
              }
              imm = dex(d,7,7)*2048 + dex(d,30,25)*32 + dex(d,11,8)*2 -d*2;             
              hexconvert(imm);
              fprintf(fp1,"%s x%d ,x%d ,%s\n",RISC,rs1,rs2,immhex);
        break;
      case  0:
              imm = dex(d,30,20);   
              switch (opcode1)
              {
                case 0:
                strcpy(RISC,"LB  ");
                break;
                case 1:
                strcpy(RISC,"LH  ");
                break;
                case 2:
                strcpy(RISC,"LW  ");
                break;
                case 4:
                strcpy(RISC,"LBU ");
                break;
                case 5:
                strcpy(RISC,"LHU ");
                break;
                default:strcpy(RISC,"????"); 
                break;
              }

              hexconvert(imm);
              fprintf(fp1,"%s x%d, %s(x%d)\n",RISC,rd,immhex,rs1);
        break;  
      case 8:
         switch (opcode1)
              {
                case 0:
                strcpy(RISC,"SB  ");
                break;
                case 1:
                strcpy(RISC,"SH  ");
                break;
                case 2:
                strcpy(RISC,"SW  ");
                break;
                default:strcpy(RISC,"????"); 
                break;
              }
              imm = dex(d,30,25)*32 + dex(d,11,7) - d; 
              hexconvert(imm);
              fprintf(fp1,"%s x%d, %s(x%d)\n",RISC,rs2,immhex,rs1);
        break;   
       case 4:
              imm = dex(d,30,20);   
              switch (opcode1)
              {
                case 0:
                strcpy(RISC,"ADDI");
                break;
                case 2:
                strcpy(RISC,"SLTI");
                break;
                case 3:
                strcpy(RISC,"SLTIU");
                break;
                case 4:
                strcpy(RISC,"XORI");
                break;
                case 6:
                strcpy(RISC,"ORI ");
                break;
                case 7:
                strcpy(RISC,"ANDI ");
                break;
                case 1:
                strcpy(RISC,"SLLI");
                imm = dex(0,24,20);
                break;
                case 5:
                 if (bin[1] == '0') strcpy(RISC,"SRLI");
                 else strcpy(RISC,"SRAI");
                imm = dex(0,24,20);
                break;
                default:strcpy(RISC,"????"); 
                break;
              }
              hexconvert(imm);
              fprintf(fp1,"%s x%d, x%d, %s\n",RISC,rd,rs1,immhex);
        break; 
       case 12:
              switch (opcode1)
              { 
                case 0:
                if (bin[1] == '0') strcpy(RISC,"ADD ");
                 else strcpy(RISC,"SUB ");
                break;
                case 1:
                strcpy(RISC,"SLL ");
                break;
                case 2:
                strcpy(RISC,"SLT ");
                break;
                case 3:
                strcpy(RISC,"SLTU");
                break;
                case 4:
                strcpy(RISC,"XOR ");
                break;
                case 5:
                if (bin[1] == '0') strcpy(RISC,"SRL ");
                 else strcpy(RISC,"SRA ");
                break;
                case 6:
                strcpy(RISC,"OR  ");
                imm = dex(0,24,20);
                break;
                case 7:
                 strcpy(RISC,"AND ");
                break;
                default:strcpy(RISC,"????"); 
                break;
              }
              fprintf(fp1,"%s x%d, x%d, x%d\n",RISC,rd,rs1,rs2);
        break;
        case 13:
              imm = dex(0,31,12);
              hexconvert(imm);
              fprintf(fp1,"LUI  x%d, %s\n",rd,immhex);
        break;      
        case 5:
              imm = dex(0,31,12);
              hexconvert(imm);
              fprintf(fp1,"AUIPC x%d, %s\n",rd,immhex);
        break;
        case 27:
            /////////////[10:1]   +  //[11]          [12:19]
              imm = dex(d,30,21)*2 + dex(d,20,20)*2048 +dex(d,19,12)*4096-2*d;
              hexconvert(imm);
              fprintf(fp1,"JAL x%d, %s\n",rd,immhex);
        break;
        case 25:
              imm = dex(d,30,20);
              hexconvert(imm);
              fprintf(fp1,"JALR x%d, x%d, %s\n",rd,rs1,immhex);
        break; 
      default:fprintf(fp1,"???????????\n");
        break;
      } 
    }
}