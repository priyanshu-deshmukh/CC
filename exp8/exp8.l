%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[ \t]       ; /* Ignore whitespace */
\n          { return '\n'; }
[-+*/()]   { return yytext[0]; }
.           { printf("character is invalid: %s\n", yytext); }
%%

int yywrap() { 
    return 1; 
}