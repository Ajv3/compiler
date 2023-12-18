%{
#include<stdio.h>
int lc=0,wc=0,sc=0,cc=0;
%}
%%
[\n] {lc++; }
[\t ] {sc++; cc+=yyleng;}
[^\t^\n ]+ { wc++; cc+=yyleng;}
%%
int main()
{
yyin=fopen("sample.txt","r");
yylex();
printf("line count=%d",lc);
printf("\nword count=%d",wc);
printf("\nspace count=%d",sc);
printf("\ncharacter count=%d",cc);
return 0;
}
int yywrap()
{
return 1;
}
