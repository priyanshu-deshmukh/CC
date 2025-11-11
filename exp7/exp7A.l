%{
#include <stdio.h>
int counter_1 = 0;
int counter_2 = 0;
%}

%%
[+\-*/%]   { counter_1++; }
[0-9]+      { counter_2++; }
[ \t\n]     ;
%%

int main() {
    printf("Enter an expression: ");
    yylex();
    
    if (counter_2 != counter_1 + 1) {
        printf("Invalid expression\n");
        return 0;
    }
    
    printf("Number of operators: %d\n", counter_1);
    printf("Number of operands: %d\n", counter_2);
    
    return 0;
}

int yywrap() {
    return 1;
}