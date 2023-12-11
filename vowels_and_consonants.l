%{
#include<stdio.h>
int vow=0,cons=0;
%}

%%
[aAeEiIoOuU] {vow++;}
[a-zA-Z] {cons++;}
\n ;
. ;
%%

int yywrap()
{
	return 1;
}

int main()
{
	yyin=fopen("sample.txt","r");
	if(!yyin)
	{
		printf("Can't open the file\n");
		exit(0);
	}
	yylex();
	printf("No of vowels     = %d\n",vow);
	printf("No of consonants = %d\n",cons);
	return 0;
}
