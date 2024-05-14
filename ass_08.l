%{
       #include"y.tab.h"
       extern char yyval;
%}

%%

[0-9]+ {yylval.symbol=(char)(yytext[0]); return number;}
[a-z] {yylval.symbol=(char)(yytext[0]); return letter;}
. {return yytext[0];}
\n {return 0;}

%%
