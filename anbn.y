%{
#include <stdio.h>
#include <stdlib.h>
%}

%token A B NL

%%
stmt: S NL {
    printf("Valid string\n");
    exit(0);
}
;

S: A S B |
   ;

%%

int yyerror(char *msg) {
    printf("Invalid string\n");
    exit(0);
}

int main() {
    printf("Enter the string\n");
    yyparse();
    return 0;
}