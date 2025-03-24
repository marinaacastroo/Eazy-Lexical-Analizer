%option yylineno
%option case-insensitive

%{
#include <stdio.h>
#include "eazy.h"
%}

%%

[ \t\r\n]+       ; 

"abstracto"     {printf("linea %d, palabra reservada: ABSTRACTO\n" , yylineno); return ABSTRACTO};
"and"           {printf("linea %d, palabra reservada: AND\n" , yylineno); return AND};
"cada"          {printf("linea %d, palabra reservada: CADA\n" , yylineno); return CADA};
"cadena"        {printf("linea %d, palabra reservada: CADENA\n" , yylineno); return CADENA};
"caracter"      {printf("linea %d, palabra reservada: CARACTER\n" , yylineno); return CARACTER};
"clase"         {printf("linea %d, palabra reservada: CLASE\n" , yylineno); return CLASE};
"como"          {printf("linea %d, palabra reservada: COMO\n" , yylineno); return COMO};
"constantes"    {printf("linea %d, palabra reservada: CONSTANTES\n" , yylineno); return CONSTANTES};
"constructor"   {printf("linea %d, palabra reservada: CONSTRUCTOR\n" , yylineno); return CONSTRUCTOR};
"continuar"     {printf("linea %d, palabra reservada: CONTINUAR\n" , yylineno); return CONTINUAR};
"de"            {printf("linea %d, palabra reservada: DE\n" , yylineno); return DE};
"defecto"       {printf("linea %d, palabra reservada: DEFECTO\n" , yylineno); return DEFECTO};
"destructor"    {printf("linea %d, palabra reservada: DESTRUCTOR\n" , yylineno); return DESTRUCTOR};
"devolver"      {printf("linea %d, palabra reservada: DEVOLVER\n" , yylineno); return DEVOLVER};
"ejecuta"       {printf("linea %d, palabra reservada: EJECUTA\n" , yylineno); return EJECUTA};
"encambio"      {printf("linea %d, palabra reservada: ENCAMBIO\n" , yylineno); return ENCAMBIO};
"entero"        {printf("linea %d, palabra reservada: ENTERO\n" , yylineno); return ENTERO};
"enumeracion"   {printf("linea %d, palabra reservada: ENUMERACION\n" , yylineno); return ENUMERACION};
"en"            {printf("linea %d, palabra reservada: EN\n" , yylineno); return EN};
"es"            {printf("linea %d, palabra reservada: ES\n" , yylineno); return ES};
"escape"        {printf("linea %d, palabra reservada: ESCAPE\n" , yylineno); return ESCAPE};
"especifico"    {printf("linea %d, palabra reservada: ESPECIFICO\n" , yylineno); return ESPECIFICO};
"estructura"    {printf("linea %d, palabra reservada: ESTRUCTURA\n" , yylineno); return ESTRUCTURA};
"etiqueta"      {printf("linea %d, palabra reservada: ETIQUETA\n" , yylineno); return ETIQUETA};
"excepcion"     {printf("linea %d, palabra reservada: EXCEPCION\n" , yylineno); return EXCEPCION};
"nada"          {printf("linea %d, palabra reservada: NADA\n" , yylineno); return NADA};
"or"            {printf("linea %d, palabra reservada: OR\n" , yylineno); return OR};
"otra"          {printf("linea %d, palabra reservada: OTRA\n" , yylineno); return OTRA};
"para"          {printf("linea %d, palabra reservada: PARA\n" , yylineno); return PARA};
"principio"     {printf("linea %d, palabra reservada: PRINCIPIO\n" , yylineno); return PRINCIPIO};
"privado"       {printf("linea %d, palabra reservada: PRIVADO\n" , yylineno); return PRIVADO};
"programa"      {printf("linea %d, palabra reservada: PROGRAMA\n" , yylineno); return PROGRAMA};
"protegido"     {printf("linea %d, palabra reservada: PROTEGIDO\n" , yylineno); return PROTEGIDO};
"publico"       {printf("linea %d, palabra reservada: PUBLICO\n" , yylineno); return PUBLICO};
"real"          {printf("linea %d, palabra reservada: REAL\n" , yylineno); return REAL};
"ref"           {printf("linea %d, palabra reservada: REF\n" , yylineno); return REF};
"saltar"        {printf("linea %d, palabra reservada: SALTAR\n" , yylineno); return SALTAR};
"si"            {printf("linea %d, palabra reservada: SI\n" , yylineno); return SI};
"sino"          {printf("linea %d, palabra reservada: SINO\n" , yylineno); return SINO};
"tamano"        {printf("linea %d, palabra reservada: TAMANO\n" , yylineno); return TAMANO};
"tabla"         {printf("linea %d, palabra reservada: TABLA\n" , yylineno); return TABLA};
"tipos"         {printf("linea %d, palabra reservada: TIPOS\n" , yylineno); return TIPOS};
"ultima"        {printf("linea %d, palabra reservada: ULTIMA\n" , yylineno); return ULTIMA};
"union"         {printf("linea %d, palabra reservada: UNION\n" , yylineno); return UNION};
"variables"     {printf("linea %d, palabra reservada: VARIABLES\n" , yylineno); return VARIABLES};

"="             {printf("linea %d, operador: ASIG\n" , yylineno); return ASIG};
"&="            {printf("linea %d, operador: AND_ASIG\n" , yylineno); return AND_ASIG};
"->"            {printf("linea %d, operador: FLECHA_DCHA\n" , yylineno); return FLECHA_DCHA};
"<-"            {printf("linea %d, operador: FLECHA_IZDA\n" , yylineno); return FLECHA_IZDA};
"/="            {printf("linea %d, operador: DIV_ASIG\n" , yylineno); return DIV_ASIG};
"=="            {printf("linea %d, operador: EQ\n" , yylineno); return EQ};
"%="            {printf("linea %d, operador: MOD_ASIG\n" , yylineno); return MOD_ASIG};
"*="            {printf("linea %d, operador: MULT_ASIG\n" , yylineno); return MULT_ASIG};
"!="            {printf("linea %d, operador: NEQ\n" , yylineno); return NEQ};
"**="           {printf("linea %d, operador: POT_ASIG\n" , yylineno); return POT_ASIG};
"**"            {printf("linea %d, operador: POTENCIA\n" , yylineno); return POTENCIA};
"-="            {printf("linea %d, operador: RESTA_ASIG\n" , yylineno); return RESTA_ASIG};
"+="            {printf("linea %d, operador: SUMA_ASIG\n" , yylineno); return SUMA_ASIG};
"^="            {printf("linea %d, operador: XOR_ASIG\n" , yylineno); return XOR_ASIG};

[0-9]+            return CTC_ENTERA;
[0-9]+\.[0-9]+    return CTC_REAL;
"\"([^\"]|\\.)*\"" return CTC_CADENA;
'([^\\']|\\.)'   return CTC_CARACTER;

[a-zA-Z_][a-zA-Z0-9_]* return IDENTIFICADOR;

[;]            {printf("linea %d, delimitador\n" , yylineno); return yytext[0];}
[,]            {printf("linea %d, delimitador\n" , yylineno); return yytext[0];}
[{]            {printf("linea %d, delimitador\n" , yylineno); return yytext[0];}
[}]            {printf("linea %d, delimitador\n" , yylineno); return yytext[0];}
[(]            {printf("linea %d, delimitador\n" , yylineno); return yytext[0];}
[)]            {printf("linea %d, delimitador\n" , yylineno); return yytext[0];}
[:]            {printf("linea %d, delimitador\n" , yylineno); return yytext[0];}
[.]            {printf("linea %d, delimitador\n" , yylineno); return yytext[0];}
[::]           {printf("linea %d, delimitador\n" , yylineno); return yytext[0];}

. {
  printf("Error: Caracter inesperado '%s' en la línea %d\n", yytext, yylineno);
  return 1;  
}

"//".*           ;
"/*"([^*]|\*+[^*/])*"*/" ; 

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
