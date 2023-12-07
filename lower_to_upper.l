%{
    #include<stdio.h>      
%}


%%
[a-z] { printf("%c", yytext[0] - 32); }
[\t\n]+ { printf("\n"); }
. { printf("%c", yytext[0]); }
%%

int yywrap()
{
	return 1;
}

int main()
{
	yyin=fopen("sample.txt", "r"); 
	yylex();
    return 0;
}
