%{
       #include<stdio.h>
%}

%token datatype id comma semicolon newline value

%%

start: datatype varlist semicolon newline {printf("\nDeclaration Statement is Syntactically Correct\n");}
       | varlist:varlist comma id|id;
%%

int main()
{
       printf("\nEnter the Declaration Statement: ");
       yyparse();
}

int yywrap()
{
       return 1;
}

void yyerror(const char *str)
{
       printf("\nSyntax Error");
       return 0;
}
