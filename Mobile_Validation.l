%{
#include<stdio.h>
int flag=0;
%}

%%
[1-9][0-9]{9} {printf("Mob no is Valid\n");}
.* {printf("Mob no is Invalid\n");}
%%

int yywrap()
{
	return 1;
}

int main()
{	
	printf("Enter a mob no : ");
	yylex();	
}
