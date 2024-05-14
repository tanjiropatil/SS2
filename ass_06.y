%{
       /*Declaration Section*/
       
       #include<stdio.h>
       int flag=0;

%}

%token number

%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

/* Rule Section*/
%%

S:E{
        printf("\nResult= %d\n", $$);
        return 0;
        };
E:E'+'E {$$=$1+$3;}
|E'-'E {$$=$1-$3;}
|E'*'E {$$=$1*$3;}
|E'/'E {$$=$1/$3;}
|E'%'E {$$=$1%$3;}
|'('E')' {$$=$2;}
| number {$$=$1;}

;
%%

void main()
{
        printf("\nEnter any Arithmetic Expression: ");
        yyparse();
        if(flag==0)
               printf("\nEntered Arithmetic Expression is Valid\n\n");
}

void yyerror()
{
        printf("\nEntered Arithmetic Expression is Invalid\n\n");
        flag=1;
}
