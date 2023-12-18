%{
#include<stdio.h>
#include<stdlib.h>
int flag=1;
int yylex();
int yyerror();
%}
%token NUMBER
%left '+''-'
%left '*''/'
%left '('')'
%%
ArithmaticExpression:E{ printf("result=%d",$$);
return 0;}
E:E'+'E{$$=$1+$3;}
|E'-'E{$$=$1-$3;}
|E'*'E{$$=$1*$3;}
|E'/'E{$$=$1/$3;}
|'('E')'{$$=$2;};
|NUMBER {$$=$1;}
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
