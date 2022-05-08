%{
#include <stdio.h>
#include "cgcc.h"

extern int yylex(void);

void
yyerror(char *s)
{
	printf("Error: %s\n", s);
}
%}

%start program

%token INT_LITERAL
%token INT_TYPE_LITERAL
%token MAIN
%token LPAREN
%token RPAREN
%token LBRACE
%token RBRACE
%token RETURN
%token SEMICOLON

%%
program: INT_TYPE_LITERAL MAIN LPAREN RPAREN LBRACE RETURN INT_LITERAL SEMICOLON RBRACE {
	mainprogram = $7;
}
%%

