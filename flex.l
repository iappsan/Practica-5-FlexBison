INTEGER [0-9]+
DECIMAL [0-9]+\.[0-9]*|.[0-9]+
OPER    [+|\-|*|/]
MOD     [Mm][Oo][Dd]\({INTEGER}\,{INTEGER}\)
MATHS   {INTEGER}{OPER}{INTEGER}|{INTEGER}{OPER}{DECIMAL}|{DECIMAL}{OPER}{INTEGER}|{DECIMAL}{OPER}{DECIMAL}

%%
{INTEGER} {
    printf("Entero");
}

{DECIMAL} {
    printf("Decimal");
}

{MOD} {
    printf("Modulo");
}

{MATHS} {
    printf("Operacion");
}
%%