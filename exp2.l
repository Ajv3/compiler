%{
int COMMENT = 0;
%}

identifier [a-zA-Z][a-zA-Z0-9]*

%%
#.*                                     { printf("\n%s is a preprocessor directive\n", yytext); }
int|float|char|double|while|for|struct|typedef|do|if|break|continue|void|switch|return|else|goto|main {
                                        if (!COMMENT) printf("\n %s : Keyword", yytext);
                                        }
"/*"                                    { COMMENT = 1; printf("\n Comment Start"); }
"*/"                                    { COMMENT = 0; printf("\n Comment End"); }
\+                                      { if (!COMMENT) printf("\n Operator: +"); }
\-                                      { if (!COMMENT) printf("\n Operator: -"); }
\*                                      { if (!COMMENT) printf("\n Operator: *"); }
\/                                      { if (!COMMENT) printf("\n Operator: /"); }
\(                                      { if (!COMMENT) printf("\n Special Symbol: %s", yytext); }
\)                                      { if (!COMMENT) printf("\n Special Symbol: %s", yytext); }
\;                                      { if (!COMMENT) printf("\n Special Symbol: %s", yytext); }

{identifier}\(                           { if (!COMMENT) printf("\n Function & opening bracket: %s \n", yytext); }
\{                                      { if (!COMMENT) printf(" Block Begins : {"); }
\}                                      { if (!COMMENT) printf(" Block Ends : }"); }
{identifier}(\[[0-9]*\])?               { if (!COMMENT) printf("\n Identifier: %s\n", yytext); }
\".*\"                                  { if (!COMMENT) printf("\n String: %s\n", yytext); }
[0-9]+(\.[0-9]+)?(E[+|-]?[0-9]+)?       { if (!COMMENT) printf("\n Number: %s\n", yytext); }
\)(\:)?                                 { if (!COMMENT) printf("\n\t"); ECHO; printf("\n"); }

=                                       { if (!COMMENT) printf("\n Operator: =\n"); }
\<= | \>= | \< | == | \>                { if (!COMMENT) printf("\n Relational Operator: %s\n", yytext); }

%%
int main()
{
yyin=fopen("input.txt","r");
yylex();
printf("\n");
return 0;
}
int ywrap()
{
 return 1;
}

/*
int main(int argc, char **argv) {
    FILE *file;
    file = fopen("input.txt", "r");
    if (!file) {
        printf("Could not open the file");
        exit(0);
    }
    yyin = file;
    yylex();
    printf("\n");
    return 0;
}

int yywrap() {
    return 1;
}*/

