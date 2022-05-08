tcc: tcc.c y.tab.c lex.yy.c
	cc -g -o tcc tcc.c y.tab.c lex.yy.c -lfl

clean:
	rm -f tcc y.tab.c y.tab.h lex.yy.c

y.tab.c y.tab.h: parse.y tcc.h
	yacc -d parse.y

lex.yy.c: lex.l y.tab.h tcc.h
	lex lex.l
