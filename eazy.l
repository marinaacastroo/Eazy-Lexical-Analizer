%option yylineno

%{
#include <stdio.h>
#include "eazy.h"
%}


IDENTIFICADOR  [A-Za-z_][A-Za-z_0-9]*

NUM_DECIMAL     [0-9]+
NUM_OCTAL       [0-7]+
NUM_HEXADECIMAL [0-9a-fA-F]+

CONST_DECIMAL     {NUM_DECIMAL}
CONST_OCTAL       "%"{NUM_OCTAL}
CONST_HEXADECIMAL "%[hH]"{NUM_HEXADECIMAL}


REAL_DECIMAL ({NUM_DECIMAL}?","){NUM_DECIMAL}+
REAL_OCTAL         "%"{NUM_OCTAL}?","{NUM_OCTAL}
REAL_HEXADECIMAL   "%[hH]"{NUM_HEXADECIMAL}?","{NUM_HEXADECIMAL}

EXPONENTE          "exp"[-+]?({NUM_DECIMAL}|"%"{NUM_OCTAL}|"%[hH]"{NUM_HEXADECIMAL})

REAL_DEC_EXP      ({NUM_DECIMAL} | {REAL_DECIMAL}){EXPONENTE}
REAL_OCT_EXP      ("%"{NUM_OCTAL} | {REAL_OCTAL}){EXPONENTE}
REAL_HEX_EXP      ("%[hH]"{NUM_HEXADECIMAL} | {REAL_HEXADECIMAL}){EXPONENTE}

CARACTER_VISIBLE    [^"\n%]   // Cualquier carácter excepto " (comillas dobles), salto de línea y '%'
ESCAPADO            "%%" | "%\"" | "%f" | "%n" | "%r" | "%t"

CARACTER_OCTAL "%([0-7]{1,2}|1[0-7]{2})"   // Rango de números octales válidos hasta %177
CARACTER_HEXA "%[hH]([0-7][0-9a-fA-F]?)"   // Asegura que el valor esté en el rango 00-7F

CADENA  \"([^\n"]|ESCAPADO|CARACTER_OCTAL|CARACTER_HEXA|"%"\n)*\"

DELIMITADOR [():;.\:\:]

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

{DELIMITADOR}       {printf("linea %d, delimitador: %s\n" , yylineno, yytext); return DELIMITADOR;}
{CONST_DECIMAL}    {printf("linea %d, constante decimal: %s\n" , yylineno, yytext); return CONST_DECIMAL;}
{CONST_OCTAL}      {printf("linea %d, constante octal: %s\n" , yylineno, yytext); return CONST_OCTAL;}
{CONST_HEXADECIMAL} {printf("linea %d, constante hexadecimal: %s\n" , yylineno, yytext); return CONST_HEXADECIMAL;}
{REAL_DECIMAL}     {printf("linea %d, constante real decimal: %s\n" , yylineno, yytext); return REAL_DECIMAL;}
{REAL_OCTAL}       {printf("linea %d, constante real octal: %s\n" , yylineno, yytext); return REAL_OCTAL;}
{REAL_HEXADECIMAL} {printf("linea %d, constante real hexadecimal: %s\n" , yylineno, yytext); return REAL_HEXADECIMAL;}
{REAL_DEC_EXP}     {printf("linea %d, constante real decimal con exponente: %s\n" , yylineno, yytext); return REAL_DEC_EXP;}
{REAL_OCT_EXP}     {printf("linea %d, constante real octal con exponente: %s\n" , yylineno, yytext); return REAL_OCT_EXP;}
{REAL_HEX_EXP}     {printf("linea %d, constante real hexadecimal con exponente: %s\n" , yylineno, yytext); return REAL_HEX_EXP;}
{CARACTER_VISIBLE} {printf("linea %d, caracter visible: %s\n" , yylineno, yytext); return CARACTER_VISIBLE;}
{ESCAPADO}         {printf("linea %d, caracter escapado: %s\n" , yylineno, yytext); return ESCAPADO;}
{CARACTER_OCTAL}   {printf("linea %d, caracter octal: %s\n" , yylineno, yytext); return CARACTER_OCTAL;}
{CARACTER_HEXA}    {printf("linea %d, caracter hexadecimal: %s\n" , yylineno, yytext); return CARACTER_HEXA;}
{CADENA}           {printf("linea %d, cadena: %s\n" , yylineno, yytext); return CADENA;}



"+"             {nl(); fprintf(yyout, "operador aritmetico: %s \n", yytext); return (int)yytext[0];}
"-"             {nl(); fprintf(yyout, "operador aritmetico: %s \n", yytext); return (int)yytext[0];}
"*"             {nl(); fprintf(yyout, "operador aritmetico: %s \n", yytext); return (int)yytext[0];}
"/"             {nl(); fprintf(yyout, "operador aritmetico: %s \n", yytext); return (int)yytext[0];}
"mod"          {nl(); fprintf(yyout, "operador aritmetico: %s \n", yytext); return MOD;}
"**"           {nl(); fprintf(yyout, "operador aritmetico: %s \n", yytext); return POTENCIA;}

"<-"            {nl(); fprintf(yyout, "operador de bits: %s \n", yytext); return FLECHA_IZDA;}
"->"            {nl(); fprintf(yyout, "operador de bits: %s \n", yytext); return FLECHA_DCHA;}
"&"             {nl(); fprintf(yyout, "operador de bits: %s \n", yytext); return (int)yytext[0];}
"|"             {nl(); fprintf(yyout, "operador de bits: %s \n", yytext); return (int)yytext[0];}
"@"             {nl(); fprintf(yyout, "operador de bits: %s \n", yytext); return (int)yytext[0];}
"~"             {nl(); fprintf(yyout, "operador de bits: %s \n", yytext); return (int)yytext[0];}

"<"             {nl(); fprintf(yyout, "operador relacional: %s \n", yytext); return (int)yytext[0];}
">"             {nl(); fprintf(yyout, "operador relacional: %s \n", yytext); return (int)yytext[0];}
"<="           {nl(); fprintf(yyout, "operador relacional: %s \n", yytext); return LE;}
">="           {nl(); fprintf(yyout, "operador relacional: %s \n", yytext); return GE;}
"=="           {nl(); fprintf(yyout, "operador relacional: %s \n", yytext); return EQ;}
"!="           {nl(); fprintf(yyout, "operador relacional: %s \n", yytext); return NEQ;}

"!"             {nl(); fprintf(yyout, "operador logico: %s \n", yytext); return (int)yytext[0];}
"&&"           {nl(); fprintf(yyout, "operador logico: %s \n", yytext); return AND;}
"||"           {nl(); fprintf(yyout, "operador logico: %s \n", yytext); return OR;}

":="           {nl(); fprintf(yyout, "operador de asignacion: %s \n", yytext); return ASIG;}
"+="          {nl(); fprintf(yyout, "operador de asignacion: %s \n", yytext); return SUMA_ASIG;}
"-="          {nl(); fprintf(yyout, "operador de asignacion: %s \n", yytext); return RESTA_ASIG;}
"*="          {nl(); fprintf(yyout, "operador de asignacion: %s \n", yytext); return MULT_ASIG;}
"/="          {nl(); fprintf(yyout, "operador de asignacion: %s \n", yytext); return DIV_ASIG;}
"mod="        {nl(); fprintf(yyout, "operador de asignacion: %s \n", yytext); return MOD_ASIG;}
"**="         {nl(); fprintf(yyout, "operador de asignacion: %s \n", yytext); return POT_ASIG;}
"<-="         {nl(); fprintf(yyout, "operador de asignacion: %s \n", yytext); return FI_ASIG;}
"->="         {nl(); fprintf(yyout, "operador de asignacion: %s \n", yytext); return FD_ASIG;}
"&="          {nl(); fprintf(yyout, "operador de asignacion: %s \n", yytext); return AND_ASIG;}
"@="          {nl(); fprintf(yyout, "operador de asignacion: %s \n", yytext); return XOR_ASIG;}
"|="          {nl(); fprintf(yyout, "operador de asignacion: %s \n", yytext); return OR_ASIG;}

"tamano"       {nl(); fprintf(yyout, "operador de acceso a memoria: %s \n", yytext); return TAMANO;}
/* TODO: definir tamano si es en mayusculas entonces es identificador */
"?"            {nl(); fprintf(yyout, "operador de acceso a memoria: %s \n", yytext); return (int)yytext[0];}
"^"            {nl(); fprintf(yyout, "operador de acceso a memoria: %s \n", yytext); return (int)yytext[0];}
"^?"           {nl(); fprintf(yyout, "operador de acceso a memoria: %s \n", yytext); return INDIRECCION;}
"["         {nl(); fprintf(yyout, "operador de acceso a memoria: %s \n", yytext); return (int)yytext[0];}
"]"         {nl(); fprintf(yyout, "operador de acceso a memoria: %s \n", yytext); return (int)yytext[0];}
"{"         {nl(); fprintf(yyout, "operador de acceso a memoria: %s \n", yytext); return (int)yytext[0];}
"}"         {nl(); fprintf(yyout, "operador de acceso a memoria: %s \n", yytext); return (int)yytext[0];}

"::"           {nl(); fprintf(yyout, "operador: %s \n", yytext); return PTOS;}



%s COMENTARIO

%%[^\n]*      ;   /* Comentario de una línea */
"%/"          BEGIN(COMENTARIO);
<COMENTARIO>.|\n ;
<COMENTARIO>"/%" BEGIN(0);


/* Manejo de errores */
[ \t\n]                  ;  /* Ignorar espacios, tabuladores y saltos de línea */
.                        { fprintf(yyout, "ERROR en línea %d: carácter inesperado '%s'\n", yylineno, yytext); }

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