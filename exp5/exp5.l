%{
#include <stdio.h>
%}

int dec_to_int(char *s) {
    int val = 0;
    for (int i = 0; s[i] != '\0'; i++) {
        val = val * 10 + (s[i] - '0');
    }
    return val;
}

void print_hex(int num) {
    char hex[20];
    int i = 0;
    
    if (num == 0) {
        putchar('0');
        return;
    }
    
    while (num > 0) {
        int digit = num % 16;
        if (digit < 10)
            hex[i++] = '0' + digit;
        else
            hex[i++] = 'A' + (digit - 10);
        num /= 16;
    }

    for (int j = i - 1; j >= 0; j--) {
        putchar(hex[j]);
    }
}

%%
[0-9]+      { int val = dec_to_int(yytext); print_hex(val); }
.\n         { putchar(yytext[0]); }
%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}