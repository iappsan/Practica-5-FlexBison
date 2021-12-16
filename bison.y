 %{
    #include <math.h>
 %}

 /*Declaraciones de BISON*/
%union{
    int entero;
    float decimal;
}

%token <entero> ENTERO
%token <decimal> DECIMAL

%type <entero> exp
%type <decimal> dexp

%left '+' '-'
%left '/' '*'
%left ','

%%
/*Gramatica*/

input:      /*Cadena vacia*/
        | input line
;

line:   '\n'
        | exp '\n' { printf("\tResultado: %d\n", $1); }
        | dexp '\n' { printf("\tResultado: %.2f\n", $1); }
;

exp:    ENTERO { $$ = $1; }
        | exp '+' exp   { $$ = $1 + $3; }
        | exp exp       { $$ = $1 + $2; }
        | exp '/' exp   { $$ = $1 / $3; }
        | exp '*' exp   { $$ = $1 * $3; }
        | exp ',' exp   { $$ = $1 % $3; }

dexp:   DECIMAL { $$ = $1; }
        | dexp '+' dexp { $$ = $1 + $3; }
        | exp '+' dexp  { $$ = $1 + $3; }
        | dexp '+' exp  { $$ = $1 + $3; }
        | dexp dexp     { $$ = $1 + $2; }
        | exp dexp      { $$ = $1 + $2; }
        | dexp exp      { $$ = $1 + $2; }
        | dexp '/' dexp { $$ = $1 / $3; }
        | exp '/' dexp  { $$ = $1 / $3; }
        | dexp '/' exp  { $$ = $1 / $3; }
        | dexp '*' dexp { $$ = $1 * $3; }
        | exp '*' dexp  { $$ = $1 * $3; }
        | dexp '*' exp  { $$ = $1 * $3; }
        | dexp ',' dexp { $$ = fmod($1,$3); }
        | exp ',' dexp { $$ = fmod($1,$3); }
        | dexp ',' exp { $$ = fmod($1,$3); }
;
%%

int main(){
    yyparse();
}
yyerror (char *s){
    printf("--%s--\n",s);
}
int yywrap(){
    return 1;
}
