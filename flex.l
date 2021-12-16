%{
    #include "bison.tab.h"    
%}

INTEGER [0-9]+
DECIMAL {INTEGER}"."{INTEGER}|"."{INTEGER}
SIGINT  "-"{INTEGER}
SIGDEC  "-"{DECIMAL}
OPER    "+"|"-"|"*"|"/"|","
MOD     [Mm][Oo][Dd]
JUMP    "\n"
/* MATHS   {INTEGER}{OPER}{INTEGER}|{INTEGER}{OPER}{DECIMAL}|{DECIMAL}{OPER}{INTEGER}|{DECIMAL}{OPER}{DECIMAL} */

%%
{INTEGER} {
    printf("Entero: %s\n",yytext);
    yylval.entero = atoi(yytext);
    return (ENTERO);
}

{SIGINT} {
    printf("Entero con signo: %s\n", yytext);
	yylval.entero = atoi(yytext);
	return (ENTERO);
}

{DECIMAL} {
    printf("Decimal: %s\n", yytext);
	yylval.decimal = atof(yytext);
	return (DECIMAL);
}

{SIGDEC} {
    printf("Decimal con signo: %s\n", yytext);
	yylval.decimal = atof(yytext);
	return (DECIMAL);
}

{MOD} {
    printf("Modulo ");
}

{OPER} {
    printf("Operacion: %s\n", yytext);
    return (yytext[0]);
}

{JUMP} {
	return (yytext[0]);
}

%%