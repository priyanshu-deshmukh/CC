%{
#include <stdio.h>
int n_comments = 0;
int n_keywords = 0;
int n_identifiers = 0;
int n_words = 0;
int n_spaces = 0;
%}
%option noyywrap
%%
"//".* { n_comments++; }
"/*"([^*]|[*]+[^/])*"*/" { n_comments++; }

int|float|if|else|while|for|return|void|char|double { n_keywords++; }

[a-zA-Z_][a-zA-Z0-9_]* { n_identifiers++; }

[a-zA-Z]+ { n_words++; }

[ \t\n]+ { n_spaces += yyleng; }
%%
int main(void) {
    yylex();
    printf("Comments: %d\n", n_comments);
    printf("Keywords: %d\n", n_keywords);
    printf("Identifiers: %d\n", n_identifiers);
    printf("Words: %d\n", n_words);
    printf("Spaces: %d\n", n_spaces);
    return 0;
}
