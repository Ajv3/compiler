	

%{
#include<stdio.h>
int vow=0,con=0;
%}
%%
[aeiouAEIOU] {vow++;}
[a-zA-Z] {con++;}
%%
int main()
{
yyin=fopen("vow.txt","r");
yylex();
printf("vowels=%d",vow);
printf("\nconsonants=%d",con);
return 0;
}
int yywrap()
{
return 1;
}

