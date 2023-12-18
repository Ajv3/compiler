%{
#include<stdio.h>
#include<stdlib.h>
int flag=1;
int yylex();
int yyerror();
%}
%token letter digit

%%
start:letter s
s:letter s|digit s| ;
%%
int yywrap()
{
return 1;
}
void main()
{
printf("enter an expression\n");
yyparse();
if(flag==1)
{printf("valid");
}
else{
printf("not valid\n");}
}
int yyerror(char *s)
{
flag=0;
return 0;
}
