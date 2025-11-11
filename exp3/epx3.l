%{
#include <stdio.h>
int count = 0;
%}

%%
[aA][a-zA-Z]* { count++; }
.\n             {ECHO;}
%%

int main()
{
    printf("Enter your code (Ctrl+D to end input):\n");
    yylex();
    printf("Number of words starting with 'a' or 'A': %d\n", count);
    return 0;
}

int yywrap() {
    return 1;
}