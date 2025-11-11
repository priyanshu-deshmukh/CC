%{
#include<stdio.h>
#include "y.tab.h" 
%}

%%
[0-9]+      {yylval = atoi(yytext); return NUMBER;}
[\-+\*/]   {return yytext[0];}
\n          {return '\n';}
.           {printf("%s",yytext);}
%%

int yywrap() {
    return 1;
}