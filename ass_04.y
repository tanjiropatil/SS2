%{
        #include<stdio.h>
%}

%token Compound Word Fullstop

%%
start:wordlist Compound wordlist Fullstop {printf("\nCompound Sentence");} 
        |wordlist Fullstop {printf("\nSimple Sentence");};
        |wordlist:Word wordlist
        |Word
        ;
%%

int main()
{
        printf("\nEnter a sentence: ");
        yyparse();
        return 0;
}

int yywrap()
{
        return 1;
}

int yyerror()
{
        return 0;
}
