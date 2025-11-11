%{
#include<stdio.h>
#include<stdlib.h>

void yyerror(char *s);
int yylex(void);
%}

%token NUMBER

%%
program:
    program expr '\n' {printf("Result = %d\n", $2); }
    |
    ;

expr:
    NUMBER {$$ = $1;}
    | expr expr '+' {$$ = $1 + $2;}
    | expr expr '/' {$$ = $1 / $2;}
    | expr expr '-' {$$ = $1 - $2;}
    | expr expr '*' {$$ = $1 * $2;}
    ;
%%

void yyerror(char *s)
{
    /* Empty error function */
}

int main() {
    yyparse();
    return 0;
}