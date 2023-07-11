%{
#include <ctype.h>
#include <stdio.h>
#define YYSTYPE char*
#define YYSTYPE_IS_DECLARED 1
int label = 1;
char* print_int_gen_eq(char* t,char* expr1, char opt,char* expr2);
char* print_int_gen(char* expr1, char opt,char* expr2);
%}
%token NUMBER
%token ID
%right '+' '-'
%right '*' '/'
%%
start : ID "=" expr '+' expr { $$ = print_int_gen_eq($1,$5,"+",$3); }
|ID "=" expr "-" expr { $$ = print_int_gen_eq($1,$5,"-",$3);}
|ID "=" expr "*" expr { $$ = print_int_gen_eq($1,$5,"*",$3); }
|ID "=" expr "/" expr { $$ = print_int_gen_eq($1,$5,"/",$3);}
|ID "=" '(' expr ')' { $$ = $2; }
|ID "=" NUMBER |ID "=" ID
;

expr : expr "+" expr { $$ = print_int_gen($3,"+",$1); }
| expr "-" expr { $$ = print_int_gen($3, "-", $1); }
| expr "*" expr { $$ = print_int_gen($3, "*",  $1); }
| expr "/" expr { $$ = print_int_gen($3, "/", $1); }
| '(' expr ')' { $$ = $2; }
| NUMBER | ID
;
%%
char* print_int_gen(char* expr1, char opt,char* expr2) {
    char* t = malloc(10);
    sprintf(t, "t%d",label++);
    printf("%s = %s %c %s;\n",t,expr1,opt,expr2);
    return t;
}

char* print_int_gen_eq(char* t,char* expr1, char opt,char* expr2) {
    printf("%s = %s %c %s;\n",t,expr1,opt,expr2);
    return t;
}

int main()
{ if (yyparse() != 0)
printf( "Abnormal exit\n");
return 0;
}
int yyerror(char *s)
{ printf("Error: %s\n", s);
}