%{
        #include<stdio.h>
        #include"y.tab.h"
%}

%%

int|float|char {return datatype;}
[a-zA-Z][a-zA-Z0-9_]* {return id;}
"," {return comma;}
";" {return semicolon;}
"\n" {return newline;}

%%
