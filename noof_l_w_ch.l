%{
	#include<stdio.h>
	int lc=0,wc=0,ch=0;
%}

%%
\n {lc++;}
[a-zA-Z]+ {wc++; ch+=yyleng;}
. {ch++;}
%%

int yywrap()
{
	return 1;
}

int main()
{
	yyin=fopen("sample.txt", "r");
	yylex();
	printf("No of lines      : %d\n",lc);
	printf("No of words      : %d\n",wc);
	printf("No of characters : %d\n",ch-wc+lc);
    return 0;
}
