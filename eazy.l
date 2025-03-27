%option yylineno

%{
#include <stdio.h>
#include "eazy.h"
%}


IDENTIFICADOR  [A-Za-z_][A-Za-z_0-9]*

//Definición de tipos de constantes
NUM_DECIMAL     [0-9]+
NUM_OCTAL       [0-7]+
NUM_HEXADECIMAL [0-9a-fA-F]+

//Definicion de constantes enteras
CONST_DECIMAL     {NUM_DECIMAL}
CONST_OCTAL       "%"{NUM_OCTAL}
CONST_HEXADECIMAL "%[hH]"{NUM_HEXADECIMAL}


//Definicion de constantes reales
REAL_DECIMAL ({NUM_DECIMAL}?","){NUM_DECIMAL}+
REAL_OCTAL         "%"{NUM_OCTAL}?","{NUM_OCTAL}
REAL_HEXADECIMAL   "%[hH]"{NUM_HEXADECIMAL}?","{NUM_HEXADECIMAL}

// Exponente
EXPONENTE          "exp"[-+]?({NUM_DECIMAL}|"%"{NUM_OCTAL}|"%[hH]"{NUM_HEXADECIMAL})

// Constantes reales con exponente
REAL_DEC_EXP      ({NUM_DECIMAL} | {REAL_DECIMAL}){EXPONENTE}
REAL_OCT_EXP      ("%"{NUM_OCTAL} | {REAL_OCTAL}){EXPONENTE}
REAL_HEX_EXP      ("%[hH]"{NUM_HEXADECIMAL} | {REAL_HEXADECIMAL}){EXPONENTE}

CARACTER_VISIBLE    [^"\n%]   // Cualquier carácter excepto " (comillas dobles), salto de línea y '%'
ESCAPADO            "%%" | "%\"" | "%f" | "%n" | "%r" | "%t"

// Definición de constantes de caracteres
CARACTER_OCTAL "%([0-7]{1,2}|1[0-7]{2})"   // Rango de números octales válidos hasta %177
CARACTER_HEXA "%[hH]([0-7][0-9a-fA-F]?)"   // Asegura que el valor esté en el rango 00-7F

CADENA  \"([^\n"]|ESCAPADO|CARACTER_OCTAL|CARACTER_HEXA|"%"\n)*\"

%%

[ \t\r\n]+       ;

(?i:"abstracto")     {printf("linea %d, palabra reservada: ABSTRACTO\n" , yylineno); return ABSTRACTO;}
(?i:"cada")          {printf("linea %d, palabra reservada: CADA\n" , yylineno); return CADA;}
(?i:"cadena")        {printf("linea %d, palabra reservada: CADENA\n" , yylineno); return CADENA;}
(?i:"caracter")      {printf("linea %d, palabra reservada: CARACTER\n" , yylineno); return CARACTER;}
(?i:"clase")         {printf("linea %d, palabra reservada: CLASE\n" , yylineno); return CLASE;}
(?i:"como")          {printf("linea %d, palabra reservada: COMO\n" , yylineno); return COMO;}
(?i:"constantes")    {printf("linea %d, palabra reservada: CONSTANTES\n" , yylineno); return CONSTANTES;}
(?i:"constructor")   {printf("linea %d, palabra reservada: CONSTRUCTOR\n" , yylineno); return CONSTRUCTOR;}
(?i:"continuar")     {printf("linea %d, palabra reservada: CONTINUAR\n" , yylineno); return CONTINUAR;}
(?i:"de")            {printf("linea %d, palabra reservada: DE\n" , yylineno); return DE;}
(?i:"defecto")       {printf("linea %d, palabra reservada: DEFECTO\n" , yylineno); return DEFECTO;}
(?i:"destructor")    {printf("linea %d, palabra reservada: DESTRUCTOR\n" , yylineno); return DESTRUCTOR;}
(?i:"devolver")      {printf("linea %d, palabra reservada: DEVOLVER\n" , yylineno); return DEVOLVER;}
(?i:"ejecuta")       {printf("linea %d, palabra reservada: EJECUTA\n" , yylineno); return EJECUTA;}
(?i:"encambio")      {printf("linea %d, palabra reservada: ENCAMBIO\n" , yylineno); return ENCAMBIO;}
(?i:"entero")        {printf("linea %d, palabra reservada: ENTERO\n" , yylineno); return ENTERO;}
(?i:"enumeracion")   {printf("linea %d, palabra reservada: ENUMERACION\n" , yylineno); return ENUMERACION;}
(?i:"en")            {printf("linea %d, palabra reservada: EN\n" , yylineno); return EN;}
(?i:"es")            {printf("linea %d, palabra reservada: ES\n" , yylineno); return ES;}
(?i:"escape")        {printf("linea %d, palabra reservada: ESCAPE\n" , yylineno); return ESCAPE;}
(?i:"especifico")    {printf("linea %d, palabra reservada: ESPECIFICO\n" , yylineno); return ESPECIFICO;}
(?i:"estructura")    {printf("linea %d, palabra reservada: ESTRUCTURA\n" , yylineno); return ESTRUCTURA;}
(?i:"etiqueta")      {printf("linea %d, palabra reservada: ETIQUETA\n" , yylineno); return ETIQUETA;}
(?i:"excepcion")     {printf("linea %d, palabra reservada: EXCEPCION\n" , yylineno); return EXCEPCION;}
(?i:"fichero")       {printf("linea %d, palabra reservada: FICHERO\n" , yylineno); return FICHERO;}
(?i:"fin")           {printf("linea %d, palabra reservada: FIN\n" , yylineno); return FIN;}
(?i:"final")         {printf("linea %d, palabra reservada: FINAL\n" , yylineno); return FINAL;}
(?i:"funcion")       {printf("linea %d, palabra reservada: FUNCION\n" , yylineno); return FUNCION;}
(?i:"generico")      {printf("linea %d, palabra reservada: GENERICO\n" , yylineno); return GENERICO;}
(?i:"hash")          {printf("linea %d, palabra reservada: HASH\n" , yylineno); return HASH;}
(?i:"hacer")         {printf("linea %d, palabra reservada: HACER\n" , yylineno); return HACER;}
(?i:"importar")      {printf("linea %d, palabra reservada: IMPORTAR\n" , yylineno); return IMPORTAR;}
(?i:"lanza")         {printf("linea %d, palabra reservada: LANZA\n" , yylineno); return LANZA;}
(?i:"mientras")      {printf("linea %d, palabra reservada: MIENTRAS\n" , yylineno); return MIENTRAS;}
(?i:"nada")          {printf("linea %d, palabra reservada: NADA\n" , yylineno); return NADA;}
(?i:"or")            {printf("linea %d, palabra reservada: OR\n" , yylineno); return OR;}
(?i:"otra")          {printf("linea %d, palabra reservada: OTRA\n" , yylineno); return OTRA;}
(?i:"para")          {printf("linea %d, palabra reservada: PARA\n" , yylineno); return PARA;}
(?i:"principio")     {printf("linea %d, palabra reservada: PRINCIPIO\n" , yylineno); return PRINCIPIO;}
(?i:"privado")       {printf("linea %d, palabra reservada: PRIVADO\n" , yylineno); return PRIVADO;}
(?i:"programa")      {printf("linea %d, palabra reservada: PROGRAMA\n" , yylineno); return PROGRAMA;}
(?i:"protegido")     {printf("linea %d, palabra reservada: PROTEGIDO\n" , yylineno); return PROTEGIDO;}
(?i:"publico")       {printf("linea %d, palabra reservada: PUBLICO\n" , yylineno); return PUBLICO;}
(?i:"real")          {printf("linea %d, palabra reservada: REAL\n" , yylineno); return REAL;}
(?i:"ref")           {printf("linea %d, palabra reservada: REF\n" , yylineno); return REF;}
(?i:"saltar")        {printf("linea %d, palabra reservada: SALTAR\n" , yylineno); return SALTAR;}
(?i:"si")            {printf("linea %d, palabra reservada: SI\n" , yylineno); return SI;}
(?i:"sino")          {printf("linea %d, palabra reservada: SINO\n" , yylineno); return SINO;}
(?i:"tamano")        {printf("linea %d, palabra reservada: TAMANO\n" , yylineno); return TAMANO;}
(?i:"tabla")         {printf("linea %d, palabra reservada: TABLA\n" , yylineno); return TABLA;}
(?i:"tipos")         {printf("linea %d, palabra reservada: TIPOS\n" , yylineno); return TIPOS;}
(?i:"ultima")        {printf("linea %d, palabra reservada: ULTIMA\n" , yylineno); return ULTIMA;}
(?i:"union")         {printf("linea %d, palabra reservada: UNION\n" , yylineno); return UNION;}
(?i:"variables")     {printf("linea %d, palabra reservada: VARIABLES\n" , yylineno); return VARIABLES;}

{IDENTIFICADOR} {printf("linea %d, identificador: %s\n", yylineno, yytext); return IDENTIFICADOR;}


"="             {printf("linea %d, operador: ASIG\n" , yylineno); return ASIG;}
"&="            {printf("linea %d, operador: AND_ASIG\n" , yylineno); return AND_ASIG;}
"->"            {printf("linea %d, operador: FLECHA_DCHA\n" , yylineno); return FLECHA_DCHA;}
"<-"            {printf("linea %d, operador: FLECHA_IZDA\n" , yylineno); return FLECHA_IZDA;}
"/="            {printf("linea %d, operador: DIV_ASIG\n" , yylineno); return DIV_ASIG;}
"=="            {printf("linea %d, operador: EQ\n" , yylineno); return EQ;}
"%="            {printf("linea %d, operador: MOD_ASIG\n" , yylineno); return MOD_ASIG;}
"*="            {printf("linea %d, operador: MULT_ASIG\n" , yylineno); return MULT_ASIG;}
"!="            {printf("linea %d, operador: NEQ\n" , yylineno); return NEQ;}
"**="           {printf("linea %d, operador: POT_ASIG\n" , yylineno); return POT_ASIG;}
"**"            {printf("linea %d, operador: POTENCIA\n" , yylineno); return POTENCIA;}
"-="            {printf("linea %d, operador: RESTA_ASIG\n" , yylineno); return RESTA_ASIG;}
"+="            {printf("linea %d, operador: SUMA_ASIG\n" , yylineno); return SUMA_ASIG;}
"^="            {printf("linea %d, operador: XOR_ASIG\n" , yylineno); return XOR_ASIG;}
"+"             {printf("linea %d, operador: SUMA\n" , yylineno); return '+';}
"-"             {printf("linea %d, operador: RESTA\n" , yylineno); return '-';}
"*"             {printf("linea %d, operador: MULT\n" , yylineno); return '*';}
"/"             {printf("linea %d, operador: DIV\n" , yylineno); return '/';}
"%"             {printf("linea %d, operador: MOD\n" , yylineno); return '%';}

\%[0-7]+         {printf("linea %d, constante entera octal: %s\n", yylineno, yytext); return CTC_ENTERA;}
\%[hH][0-9a-fA-F]+ {printf("linea %d, constante entera hexadecimal: %s\n", yylineno, yytext); return CTC_ENTERA;}
[0-9]+          {printf("linea %d, constante entera decimal: %s\n", yylineno, yytext); return CTC_ENTERA;}

\%[0-7]*,\%[0-7]+ {printf("linea %d, constante real octal: %s\n", yylineno, yytext); return CTC_REAL;}
\%[hH][0-9a-fA-F]*,\%[0-9a-fA-F]+ {printf("linea %d, constante real hexadecimal: %s\n", yylineno, yytext); return CTC_REAL;}
[0-9]*,[0-9]+   {printf("linea %d, constante real decimal: %s\n", yylineno, yytext); return CTC_REAL;}

[0-9]+(,[0-9]+)?exp[+-]?[0-9]+ {printf("linea %d, constante real con exponente decimal: %s\n", yylineno, yytext); return CTC_REAL;}
\%[0-7]+(,\%[0-7]+)?exp[+-]?\%[0-7]+ {printf("linea %d, constante real con exponente octal: %s\n", yylineno, yytext); return CTC_REAL;}
\%[hH][0-9a-fA-F]+(,\%[0-9a-fA-F]+)?exp[+-]?\%[hH][0-9a-fA-F]+ {printf("linea %d, constante real con exponente hexadecimal: %s\n", yylineno, yytext); return CTC_REAL;}

"\"([^\\\"]|\\[%\"fnrt]|\\%[0-7]{1,3}|\\%[hH][0-9a-fA-F]{1,2})\"" {
    int value;
    if (sscanf(yytext, "\"\\%%%o\"", &value) == 1) { 
        if (value > 127) {
            printf("Error: Valor octal fuera de rango en la línea %d: %s\n", yylineno, yytext);
        } else {
            printf("linea %d, constante de caracter (octal): %s\n", yylineno, yytext);
            return CTC_CARACTER;
        }
    } else if (sscanf(yytext, "\"\\%%h%x\"", &value) == 1 || sscanf(yytext, "\"\\%%H%x\"", &value) == 1) { // Hexadecimal
        if (value > 127) {
            printf("Error: Valor hexadecimal fuera de rango en la línea %d: %s\n", yylineno, yytext);
        } else {
            printf("linea %d, constante de caracter (hexadecimal): %s\n", yylineno, yytext);
            return CTC_CARACTER;
        }
    } else if (strlen(yytext) == 3) { 
        printf("linea %d, constante de caracter: %s\n", yylineno, yytext);
        return CTC_CARACTER;
    } else if (strcmp(yytext, "\"\\%%\"") == 0 || strcmp(yytext, "\"\\%n\"") == 0 || strcmp(yytext, "\"\\%r\"") == 0 || 
               strcmp(yytext, "\"\\%t\"") == 0 || strcmp(yytext, "\"\\%f\"") == 0 || strcmp(yytext, "\"\\%\"") == 0) { // Escapados
        printf("linea %d, constante de caracter escapado: %s\n", yylineno, yytext);
        return CTC_CARACTER;
    } else {
        printf("Error: Constante de caracter inválida en la línea %d: %s\n", yylineno, yytext);
    }
}

'%['"%nrt]'         { printf("linea %d, constante de caracter: %s\n", yylineno, yytext); return CTC_CARACTER; }
'%([01]?[0-9]{1,2}|2[0-4][0-9]|25[0-5])' {
    printf("linea %d, constante de caracter: %s\n", yylineno, yytext);
    return CTC_CARACTER;
}
'%o[0-3]?[0-7]?[0-7]' {
    printf("linea %d, constante de caracter: %s\n", yylineno, yytext);
    return CTC_CARACTER;
}
'%x[0-9a-fA-F]?[0-9a-fA-F]' {
    printf("linea %d, constante de caracter: %s\n", yylineno, yytext);
    return CTC_CARACTER;
}


[{}();:.,|]|(::)|=> { 
    printf("linea %d, delimitador: %s\n", yylineno, yytext); 
    return yytext[0]; 
}

#\{([^#\{#\}]|\n)*#\} ;
##.* ;

. {
    printf("linea %d, ERROR: %s\n", yylineno, yytext);
}

%%

int yywrap() {
    return 1;
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Uso: ./eazy NombreArchivo\n");
        return 1;
    }
    yyin = fopen(argv[1], "r");
    if (!yyin) {
        perror("Error al abrir el archivo");
        return 1;
    }
    while (yylex());
    fclose(yyin);
    return 0;
}