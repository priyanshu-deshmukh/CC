%{
#include<stdio.h>
#include<string.h>
char c;
%}

%%
[a-z] {c = yytext[0] - 32; putchar(c);}
[A-Z] {c = yytext[0] + 32; putchar(c);}
.\n   {c = yytext[0] putchar(c);}
%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}