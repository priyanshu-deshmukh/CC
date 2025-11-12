yacc exp7B.y
lex exp7B.l
gcc lex.yy.c y.tab.c -o output
./output
