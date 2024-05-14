%{
      #include<stdio.h>
%}

%%
[/\*].*[\*/] {printf("\n%s is Multiline Comment", yytext);}
"#" {printf("\n%s is Preprocessor Statement", yytext);}
[a-z]+[\.][h] {printf("\n%s is Header File", yytext);}
int|float|double|printf|scanf|void|main {printf("\n%s is Keyword", yytext);}
[a-zA-Z_][a-zA-Z_0-9]* {printf("\n%s is an Identifier", yytext);}
"+"|"-"|"=" {printf("|n%s is an Operator", yytext);}
[0-9]+ {printf("\n%s is an Integer Number", yytext);}
[0-9]+[\.][0-9]+ {printf("\n%s is a FLoat Number", yytext);}
";"|","|"("|")"|"["|"]"|"{"|"}"|"<"|">" {printf("\n%s is Punctuation", yytext);}
["].["] {printf("\n%s is Literals", yytext);}
"//".* {printf("\n%s is Comment", yytext);}

%%

int yywrap()
{
      return 1;
}

int main()
{
      yyin = fopen("ass_02.c","r");
      yylex();
      return 0;
}
