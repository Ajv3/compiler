%{
#include "y.tab.h"
%}
%%
[0-9]+ { return digit;}
[a-zA-Z_][a-zA-Z_0-9]*  { return letter ;}
[\t]+ ;
[\n] { return 0 ;}
. {return yytext[0];}
%%

