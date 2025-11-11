%{
#include "y.tab.h"
#include <string.h>
%}

%%
[a-zA-Z][a-zA-Z0-9]*  { yylval.str = strdup(yytext); return ID; }
[0-9]+                { yylval.str = strdup(yytext); return NUM; }

"="                   { return ASSIGN; }
"+"                   { return PLUS; }
"-"                   { return MINUS; }
"*"                   { return MUL; }
"/"                   { return DIV; }
"("                   { return LEFT_PAREN; }
")"                   { return RIGHT_PAREN; }
";"                   { return SEMI; }

[ \t\n]+              ;
.                     { return yytext[0]; }
%%