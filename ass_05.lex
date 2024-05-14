%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Symbol {
    char name[50];
    int value;
};

struct Symbol symbolTable[100];
int symbolCount = 0;

void addSymbol(char* name, int value) {
    strcpy(symbolTable[symbolCount].name, name);
    symbolTable[symbolCount].value = value;
    symbolCount++;
}

#define ID 1
#define NUM 2
#define ASSIGN 3

%}

%option noyywrap

%%

[a-zA-Z][a-zA-Z0-9]*    {
                            return ID;
                        }
[0-9]+                  {
                            return NUM;
                        }
[ \t\n]                 ; // Ignore whitespace and newlines
.                       return *yytext;

"="                     return ASSIGN;

%%

int main() {
    int token;
    char identifier[50];
    while ((token = yylex()) != 0) {
        if (token == ASSIGN) {
            continue;
        }
        if (token == ID) {
            strcpy(identifier, yytext);
            printf("Identifier: %s\n", identifier);
            printf("Symbol: %s\n", identifier);
            continue;
        }
        if (token == NUM) {
            int value = atoi(yytext);
            printf("Number: %s\n", yytext);
            printf("Value: %d\n", value);
            addSymbol(identifier, value);
            continue;
        }
        printf("Invalid character: %c\n", *yytext);
    }
    
    printf("\nSymbol Table:\n");
    printf("Name\tValue\n");
    for (int i = 0; i < symbolCount; i++) {
        printf("%s\t%d\n", symbolTable[i].name, symbolTable[i].value);
    }
    
    return 0;
}

