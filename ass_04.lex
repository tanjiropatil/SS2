%{
        #include"y.tab.h"
%}

%%

and|AND|or|OR|but|BUT {return Compound;}
[a-zA-Z0-9_]+ {return Word;}
[\.] {return Fullstop;}
\t\n "" ;

%%
