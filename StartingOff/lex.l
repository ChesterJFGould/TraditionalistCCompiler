%{
#include <stdio.h>

#include "cgcc.h"
#include "y.tab.h"
%}

%%

[(] { return LPAREN; }

[)] { return RPAREN; }

[{] { return LBRACE; }

[}] { return RBRACE; }

return { return RETURN; }

int { return INT_TYPE_LITERAL; }

; { return SEMICOLON; }

[0-9]+ {
	yylval = atoi(yytext);
	return INT_LITERAL;
}

main {
	return MAIN;
}

[ \t\n] { ; }

. { return yytext[0]; }
