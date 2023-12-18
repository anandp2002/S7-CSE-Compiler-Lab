%{
#include<stdio.h>
#include<stdlib.h>

int yylex();
int yyerror();
%}

%token A B C NL

%%
stmt: S NL {printf("Valid\n");exit(0);}
;
S:A X B Y
;
X:A X |
;
Y:C Y |
;

%%

int yyerror(char *msg){
	printf("Invalid\n");
	exit(0);
}

int main(){
	printf("Enter string : ");
	yyparse();
}