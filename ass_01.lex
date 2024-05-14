%{
#include<stdio.h>
int ccount=0, capcount=0, smallcount=0, linecount=0, allwordcount=0, digitcount=0, symbolcount=0, operatorcount=0;
%}

capword [A-Z][a-zA-Z]*
smallword [a-z][a-zA-Z]*
digit [0-9]
symbol [@#$%^&~<>:;"?/'|\\!`]
operator [+*/%-]
eol \n

%%

{capword} {capcount++; allwordcount++; ccount++;}
{smallword} {smallcount++; allwordcount++; ccount++;}
{digit} {digitcount++; ccount++;}
{symbol} {symbolcount++; ccount++;}
{operator} {operatorcount++; ccount++;}
{eol} {ccount++; linecount++;}

%%

int yywrap()
{
    return 1;
}

int main(void)
{
    FILE *fp = fopen("ass_01.txt", "r");
    if (fp == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

    yyin = fp;
    yylex();

    fclose(fp);

    printf("\nNumber of Characters: %d", ccount);
    printf("\nNumber of Capital Case Words: %d", capcount);
    printf("\nNumber of Small Case Words: %d", smallcount);
    printf("\nNumber of Digits: %d", digitcount);
    printf("\nNumber of Symbols: %d", symbolcount);
    printf("\nNumber of Operators: %d", operatorcount);
    printf("\nNumber of Lines: %d", linecount);

    return 0;
}

