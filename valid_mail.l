%{
#include<stdio.h>
%}

%%
[a-zA-Z0-9]+@[a-zA-Z]+[.][com|in] {printf("Valid\n"); return 0;}
.|\n {printf("Invalid\n"); return 0;}
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter the email id: ");
    yylex();
    return 0;
}
