%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex(void);
%}

%token NUMBER

%left '+' '-'
%left '*' '/'

%%
program:
    program expr '\n' { printf("Result = %d\n", $2); }
    |
    ;

expr:
    expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    
    | expr '*' expr { $$ = $1 * $3; }
    | expr '/' expr { 
                      if ($3 == 0) {
                          printf("Division by zero\n");
                          $$ = 0;
                      } else {
                          $$ = $1 / $3;
                      }
                    }
    | '(' expr ')' { $$ = $2; }
    | NUMBER       { $$ = $1; }
    ;
%%

void yyerror(const char *s) {
}

int main() {
    yyparse();
    return 0;
}