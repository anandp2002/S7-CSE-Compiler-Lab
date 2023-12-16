%{
#include <stdio.h>
#include <stdlib.h>

int flag = 1;

int yylex();
int yyerror();
%}

%token alpha num

%left '+' '-'
%left '*' '/'

%%

S: E
E: E '+' E | E '-' E | E '*' E | E '/' E | '(' E ')' | num | alpha | num alpha;

%%

int yywrap() {
    return 1;
}

int main(void) {
    printf("Enter an expression:\n");
    yyparse();

    if (flag == 1) {
        printf("Valid\n");
    } else {
        printf("Not valid\n");
    }

    return 0;
}

int yyerror(char *s) {
    flag = 0;
    return 0;
}