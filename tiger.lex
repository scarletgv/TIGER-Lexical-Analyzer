%{ 
#include<stdio.h> 
#include<string.h> 

/* Definicoes */

// Palavras-chave
#define ARRAY 0
#define IF 1
#define THEN 2
#define ELSE 3
#define WHILE 4
#define FOR 5
#define TO 6
#define DO 7
#define LET 8
#define IN 9
#define END 10
#define OF 11
#define BREAK 12
#define NIL 13
#define FUNCTION 14
#define VAR 15
#define TYPE 16
#define IMPORT 17
#define PRIMITIVE 18

// Simbolos
#define COMMA 19
#define COLON 20
#define SEMICOLON 21
#define LEFT_PARENT 22
#define RIGHT_PARENT 23
#define LEFT_BRACKET 24
#define RIGHT_BRACKET 25
#define LEFT_BRACE 26
#define RIGHT_BRACE 27
#define DOT 28
#define PLUS 29
#define MINUS 30
#define TIMES 31
#define DIVIDE 32
#define EQUAL 33
#define NOT_EQUAL 34
#define LESS 35
#define LESS_EQUAL 36
#define GREATER 37
#define GREATER_EQUAL 38
#define AND 39
#define OR 40
#define ASSIGN 41

// Tipos
#define NUMBER 42
#define STRING 43
#define ID 44

%} 

%option noyywrap
%x C_COMMENT
  
/* Regras */
%% 

array		{ printf("<ARRAY, %s> ", yytext); return ARRAY; }	
if		{ printf("<IF, %s> ", yytext); return IF; }
then		{ printf("<THEN, %s> ", yytext); return THEN; }
else		{ printf("<ELSE, %s> ", yytext); return ELSE; }
while		{ printf("<WHILE, %s> ", yytext); return WHILE; }
for		{ printf("<FOR, %s> ", yytext); return FOR; }
to		{ printf("<TO, %s> ", yytext); return TO; }
do		{ printf("<DO, %s> ", yytext); return DO; }
let		{ printf("<LET, %s> ", yytext); return LET; }
in		{ printf("<IN, %s> ", yytext); return IN; }
end		{ printf("<END, %s> ", yytext); return END; }
of		{ printf("<OF, %s> ", yytext); return OF; }
break		{ printf("<BREAK, %s> ", yytext); return BREAK; }
nil		{ printf("<NIL, %s> ", yytext); return NIL; }
function	{ printf("<FUNCTION, %s> ", yytext); return FUNCTION; }	
var		{ printf("<VAR, %s> ", yytext); return VAR; }
type		{ printf("<TYPE, %s> ", yytext); return TYPE; }
import		{ printf("<IMPORT, %s> ", yytext); return IMPORT; }
primitive	{ printf("<PRIMITIVE, %s> ", yytext); return PRIMITIVE; }

","		{ printf("<COMMA, %s> ", yytext); return COMMA; }
":"		{ printf("<COLON, %s> ", yytext); return COLON; }
";"		{ printf("<SEMICOLON, %s> ", yytext); return SEMICOLON; }
"("		{ printf("<LEFT_PARENT, %s> ", yytext); return LEFT_PARENT; }
")"		{ printf("<RIGHT_PARENT, %s> ", yytext); return RIGHT_PARENT; }
"["		{ printf("<LEFT_BRACKET, %s> ", yytext); return LEFT_BRACKET; }
"]"		{ printf("<RIGHT_BRACKET, %s> ", yytext); return RIGHT_BRACKET; }
"{"		{ printf("<LEFT_BRACE, %s> ", yytext); return LEFT_BRACE; }
"}"		{ printf("<RIGHT_BRACE, %s> ", yytext); return RIGHT_BRACE; }
"."		{ printf("<DOT, %s> ", yytext); return DOT; }
"+"		{ printf("<PLUS, %s> ", yytext); return PLUS; }
"-"		{ printf("<MINUS, %s> ", yytext); return MINUS; }
"*"		{ printf("<TIMES, %s> ", yytext); return TIMES; }
"/"		{ printf("<DIVIDE, %s> ", yytext); return DIVIDE; }
"="		{ printf("<EQUAL, %s> ", yytext); return EQUAL; }
"<>"		{ printf("<NOT_EQUAL, %s> ", yytext); return NOT_EQUAL; }
"<"		{ printf("<LESS, %s> ", yytext); return LESS; }
"<="		{ printf("<LESS_EQUAL, %s> ", yytext); return LESS_EQUAL; }
">"		{ printf("<GREATER, %s> ", yytext); return GREATER; }
">="		{ printf("<GREATER_EQUAL, %s> ", yytext); return GREATER_EQUAL; }
"&"		{ printf("<AND, %s> ", yytext); return AND; }
"|"		{ printf("<OR, %s> ", yytext); return OR; }
":="		{ printf("<ASSIGN, %s> ", yytext); return ASSIGN; }

[a-zA-Z][a-zA-Z0-9_]*	{ printf("<ID, %s> ", yytext); return ID; }
[0-9]+			{ printf("<NUMBER, %s> ", yytext); return NUMBER; }
\"(\\.|[^"\\])*\"	{ printf("<STRING, %s> ", yytext); return STRING; }

"/*"            { BEGIN(C_COMMENT); }
<C_COMMENT>"*/"	{ BEGIN(INITIAL); }
<C_COMMENT>\n   { continue; } 
<C_COMMENT>.    { continue; }

" "	 	{ continue; }
[ \t\f]		{ continue; }
"\n" 		{ printf("\n"); continue; } 
. 		{ printf("Syntax error."); continue;}

%% 
/* Codigo do usuario */
int main() { 
    while(1){
	yylex();
    };  
    return 0; 
} 
