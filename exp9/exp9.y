%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s) {} /* <- empty stub, no output */
%}

%token FOR ID NUMBER PRINT
%token OB CB SC ASSG RELOP INC DEC

%left RELOP
%left '+' '-'
%left '*' '/'

%%
program:
    program stmt
    | /* empty */
    ;

stmt:
    for_stmt
    | print_stmt
    | expr SC
    ;

for_stmt:
    FOR OB assign_stmt SC condition SC incdec_stmt CB stmt
        { printf("Parsed a valid for-loop!\n"); }
    ;

assign_stmt:
    ID ASSG expr
    ;

condition:
    expr RELOP expr
    ;

incdec_stmt:
    ID INC
    | ID DEC
    | ID ASSG expr
    ;

print_stmt:
    PRINT OB ID CB SC
    ;

expr:
    NUMBER
    | ID
    | expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    ;
%%

int main() {
    yyparse();
    return 0;
}