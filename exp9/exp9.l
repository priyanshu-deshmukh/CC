%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
"for"       { return FOR; }
"("         { return OB; }
")"         { return CB; }
"++"        { return INC; }
"--"        { return DEC; }
";"         { return SC; }
"<="        { return RELOP; }
"=="        { return RELOP; }
"<"         { return RELOP; }
">"         { return RELOP; }
"="         { return ASSG; }
"print"     { return PRINT; }
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }
[ \t\n]+     { /* ignore whitespace */ }
.           { return yytext[0]; }
%%

int yywrap() {
    return 1;
}