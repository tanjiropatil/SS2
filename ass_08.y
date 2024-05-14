%{
        #include"y.tab.h"
        #include<stdio.h>
        char addtotable(char, char, char);
        
        int index1=0;
        char temp = 'A'-1;
        
        struct expr
        {
                 char op1;
                 char op2;
                 char op;
                 char result;
        };
%}

%union
{
        char symbol;
}

%left '+' '-'
%left '/' '*'

%token <symbol> letter number
%type <symbol> exp

%%
statement: letter '=' exp ';' {addtotable((char)$1,(char)$3,'=');};
exp: exp '+' exp {$$ = addtotable((char)$1, (char)$3, '+');}
    |exp '-' exp {$$ = addtotable((char)$1, (char)$3, '-');}
    |exp '/' exp {$$ = addtotable((char)$1, (char)$3, '/');}
    |exp '*' exp {$$ = addtotable((char)$1, (char)$3, '*');}
    |number {$$ = (char)$1;}
    |letter {(char)$1;};
%%

struct expr arr[20];

void yyerror(char *s)
{
       printf("Error %s", s);
}

char addtotable(char a, char b, char o)
{
       temp++;
       arr[index1].op1 = a;
       arr[index1].op2 = b;
       arr[index1].op = o;
       arr[index1].result = temp;
       index1++;
       return temp;
}

void threeAdd()
{
       int i=0;
       char temp='A';
       while(i<index1)
       {
               printf("%c:=\t", arr[i].result);
               printf("%c\t", arr[i].op1);
               printf("%c\t", arr[i].op);
               printf("%c\t", arr[i].op2);
               i++;
               temp++;
               printf("\n");
       }
}

void fourAdd()
{
       int i=0;
       char temp='A';
       while(i<index1)
       {
               printf("%c\t", arr[i].op);
               printf("%c\t", arr[i].op1);
               printf("%c\t", arr[i].op);
               printf("%c", arr[i].result);
               i++;
               temp++;
               printf("\n");
       }
}

int find(char l)
{
       int i;
       for(i=0;i<index1;i++)
               if(arr[i].result==l) break;
       return i;
}

void triple()
{
       int i=0;
       char temp='A';
       while(i<index1)
       {
                printf("%c\t", arr[i].op);
                if(!isupper(arr[i].op1))
                        printf("%c\t", arr[i].op1);
                else
                {
                        printf("pointer");
                        printf("%d\t", find(arr[i].op1));
                }
                if(!isupper(arr[i].op2))
                        printf("%c\t", arr[i].op2);
                else
                {
                        printf("pointer");
                        printf("%d\t", find(arr[i].op2));
                }
                i++;
                temp++;
                printf("\n");
       }
}

int yywrap()
{
       return 1;
}

int main()
{
       printf("Enter the expression: ");
       yyparse();
       threeAdd();
       printf("\n");
       fourAdd();
       printf("\n");
       triple();
       return 0;
}
