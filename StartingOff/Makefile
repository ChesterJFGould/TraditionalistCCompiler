cgcc: cgcc.c y.tab.c lex.yy.c
	cc -g -o cgcc cgcc.c y.tab.c lex.yy.c -lfl

clean:
	rm -f cgcc y.tab.c y.tab.h lex.yy.c

y.tab.c y.tab.h: parse.y cgcc.h
	yacc -d parse.y

lex.yy.c: lex.l y.tab.h cgcc.h
	lex lex.l
