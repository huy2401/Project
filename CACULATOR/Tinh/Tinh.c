#include<stdio.h>
#include<math.h>


int ut(int i)
{
    switch(i)
    {
        case '+': return 2;
        case '-': return 2;
        case '*': return 3;
        case '/': return 3;
        case 'v': return 5;
        case '^': return 4;
        case '(': return 0;
        case ')': return 1;
    }
    return 0;
}

double kq(int i, double a, double b)
{
    switch(i)
    {
        case '+': return a+b;
        case '-': return a-b;
        case '*': return a*b;
        case '/': return a/b;
        case '^': return pow(a,b);
    }
}


int error(char s[100])
{
    int ng,i;
    ng=strlen(s)-2;
    if ((s[ng]<'0' || s[ng]>'9') && s[ng]!= ')') return 1;
    ng=0;
    for (i=0;i<strlen(s)-1;i++)
    {
        if (s[i]=='(') ng++;
        if (s[i]==')') ng--;
        if (ng < 0) return 1;
        if (s[i] > '9' || s[i]<'0' && s[i] != ')')
            if (s[i+1] =='*' || s[i+1] == '/' || s[i+1] =='^'|| s[i+1]==')')
            return 1;
        if (s[i] <= '9' || s[i]>='0')
        {
             int dem=1;
             while (s[i+dem] >= '0'&& s[i+dem] <='9')  dem++;
             if (s[i+dem] == '.')
             {
                 if (dem>15) return 1;
                 i+=dem+1;
                 while (s[i+1] >= '0'&& s[i+1] <='9')  i++;
                 if (s[i+1] == '.')return 1;
             }
        }
    }
    if (ng!=0) return 1;
    else return 0;
}


double xuly(char s[100])
{
    int sh[20],std=0,shd=0,dem,i;
    double pn,tp,st[20];
    if (s[0] == '-') st[++std]=0;
    for (i=0;i<strlen(s);i++)
    {
        if (s[i]=='(')
        {
            if ((s[i-1] >= '0'&& s[i-1] <='9') || s[i-1] == ')') sh[++shd] ='*';
            if (s[i+1] == '+'|| s[i+1]=='-') st[++std]=0;
        }

        if (s[i] < '0'|| s[i] >'9')
        {
                        if ((s[i]=='+' || s[i]=='-')
                        &&(s[i-1] =='*' || s[i-1]=='/' ||s[i-1]=='^'))
                        {
                          dem=0;
                          if (s[i] == '-') dem++;
                          while (s[i+1]=='+' || s[i+1]=='-') if  (s[++i]=='-') dem++;
                          if (dem%2==1)  sh[++shd]='-';
                           else sh[++shd]='+';
                          st[++std]=0;
                        }

                 else
                 {
                     if (s[i] == '+' || s[i]=='-')
                        {
                            dem=0;
                            if (s[i] == '-') dem++;
                            while (s[i+1] == '+' || s[i+1]=='-')
                            if ( s[++i]=='-') dem++;
                            if (dem%2==1)  s[i]='-';
                            else s[i]='+';
                        }
                 if ((shd==0 || ut(s[i]) >ut(sh[shd]) || s[i] =='(' )&& s[i] != ')') sh[++shd]=s[i];
                 else
                    {

                        while ((ut(s[i]) <= ut(sh[shd]))&& shd>0)
                        {
                         st[std-1]=kq(sh[shd],st[std-1],st[std]);
                         std--;
                         shd--;
                        }
                        if (s[i] == ')') shd--;
                        else sh[++shd]=s[i];
                    }
                 }

        }

        else
        {
            pn = s[i] - 48;
            while (s[i+1] >= '0' && s[i+1] <='9') pn = pn*10+s[++i]-48;
            if (s[i+1]=='.')
            {
                i++;
                tp=1;
                while (s[i+1] >= '0'&& s[i+1] <='9')
                {
                    tp = tp * 10;
                    pn = pn + (s[++i]-48)/tp;
                }
            }
            st[++std]=pn;
        }
    }
    return st[1];
}




