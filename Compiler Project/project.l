%{
#define YYSTYPE char*
#define YYSTYPE_IS_DECLARED 1
#include "string.h"
#include "y.tab.h"
char* install_id();
%}
delim [ \t\n]
ws {delim}+
letter [A-Za-z]
digit [0-9]
id {letter}({letter}|{digit})*
number {digit}+(\.{digit}+)?(E[+\-]?{digit}+)?
%%
{ws} { }
= {return "=";}
\( {return "("";}
\) {return ")";}
:A: {return "+";}
:S: {return "-";}
:M: {return "*";}
:D: {return "/";}
{id} {yylval = install_id(); return ID;}
{number} {yylval = install_id(); return NUMBER;}

%%

int yywrap() {}
char* install_id() {
    char* t = malloc(yyleng+1);
    strcpy(t,yytext);
    return t;

}