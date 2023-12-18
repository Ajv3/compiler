%{
#include<stdio.h>
int lc=0,sc=0,wc=0,cc=0;
%}
%%
[\n]  {lc++;}
[\t ] {sc++; cc+=yyleng;}
[^\t^\n ]+ {wc++; cc+=yyleng;}
%%
int main()
{
yyin=fopen("sample.txt","r");
yylex();
printf("line count= %d\n",lc);
printf("wor count=%d\n",wc);
printf("char count= %d\n",cc);
printf("space count=%d\n",sc);
return 0;
}
int yywrap()
{
 return 1;
}
