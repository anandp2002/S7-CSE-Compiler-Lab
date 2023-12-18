%{
#include <stdio.h>
int positiveCount = 0;
int negativeCount = 0;
%}

%%
[-+]?[0-9]+ {
    int num = atoi(yytext);
    if (num > 0) {
        positiveCount++;
    } else if (num < 0) {
        negativeCount++;
    }
}

.|\n {
    // Ignore other characters
}

%%

int main(){

    yyin = fopen("sample.txt", "r");  
    yylex();

    printf("Number of positive numbers: %d\n", positiveCount);
    printf("Number of negative numbers: %d\n", negativeCount);

    return 0;
}

int yywrap(){
    return 1;
}