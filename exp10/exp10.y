%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int tempCount = 1;

char* newTemp() {
    char* temp = (char*)malloc(10);
    sprintf(temp, "t%d", tempCount++);
    return temp;
}

int yylex();
void yyerror(const char *s);
%}

%union {
    char *str;
}

%token <str> ID NUM
%token ASSIGN PLUS MINUS MUL DIV LEFT_PAREN RIGHT_PAREN SEMI
%left PLUS MINUS
%left MUL DIV
%type <str> S E

%%
Program : Program S SEMI
        | S SEMI
        ;

S : ID ASSIGN E
    {
        printf("%s = %s\n", $1, $3);
    }
  ;

E : E PLUS E
    { char *t = newTemp(); printf("%s = %s + %s\n", t, $1, $3); $$ = strdup(t); }
  | E MINUS E
    { char *t = newTemp(); printf("%s = %s - %s\n", t, $1, $3); $$ = strdup(t); }
  | E MUL E
    { char *t = newTemp(); printf("%s = %s * %s\n", t, $1, $3); $$ = strdup(t); }
  | E DIV E
    { char *t = newTemp(); printf("%s = %s / %s\n", t, $1, $3); $$ = strdup(t); }
  | LEFT_PAREN E RIGHT_PAREN
    { $$ = $2; }
  | ID
    { $$ = strdup($1); }
  | NUM
    { $$ = strdup($1); }
  ;
%%

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main() {
    printf("Enter arithmetic expressions (end each with a semicolon):\n");
    yyparse();
    return 0;
}