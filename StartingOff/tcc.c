#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "tcc.h"
#include "y.tab.h"

/*
 * Globals Definitions
 */

program mainprogram;

/*
 * Function Definitions
 */

void
genasm(program p)
{
	printf("section .text\n");
	printf("global _main\n");
	printf("_main:\n");
	printf("mov eax, %d\n", p);
	printf("ret\n");
}

int
main(int argc, char** argv)
{
	if (yyparse()) {
		return 1;
	}

	genasm(mainprogram);

	return 0;
}
