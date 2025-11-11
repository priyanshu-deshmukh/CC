%{
#include <stdio.h>
int counter = 0;
int line_number = 1;
int line_occurence[100];
%}

%%
^.*com$   { line_occurence[counter++] = line_number; }
\n        { line_number++; }
%%

int main() {
    yylex();
    
    printf("Lines ending with 'com' are at: ");
    for (int j = 1; j <= counter; j++) {
        printf("%d\t", line_occurence[j]);
    }
    printf("\n");
    
    return 0;
}

int yywrap() {
    return 1;
}