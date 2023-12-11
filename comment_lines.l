%{
#include<stdio.h>
int single=0,multi=0;
%}

%%
"/*"[a-zA-Z0-9\n\t ]*"*/" multi++;
"//"[a-zA-Z0-9\t ]* single++;
\n ;
. ;
%%

int yywrap()
{
	return 1;
}
int main()
{
	yyin=fopen("sample.c","r");
	yylex();
	printf("Number of single line comments   = %d\n",single);
	printf("Number of multiple line comments = %d\n",multi);
	return 0;       
}
