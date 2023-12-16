%{
#include "y.tab.h"
%}

%%
[0-9]+   { return num; }
[a-z]+   { return alpha; }
[\t]+    ;                
[\n]     { return 0; }    
.        { return yytext[0]; }
%%