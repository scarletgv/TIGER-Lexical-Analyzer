
/*lex program to count number of words*/
%{ 
#include<stdio.h> 
#include<string.h> 

// Keywords
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

// Symbols
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

// Types
#define NUMBER 42
#define STRING 43
#define ID 44

// Object-related keywords
#define CLASS 45
#define EXTENDS 46
#define METHOD 47
#define NEW 48


%} 

%option noyywrap
%x C_COMMENT
  
/* Rules Section*/
%% 

array		{ printf("\n<ARRAY, %s> ", yytext); return ARRAY; }	
if		{ printf("\n<IF, %s> ", yytext); return IF; }
then		{ printf("\n<THEN, %s> ", yytext); return THEN; }
else		{ printf("\n<ELSE, %s> ", yytext); return ELSE; }
while		{ printf("\n<WHILE, %s> ", yytext); return WHILE; }
for		{ printf("\n<FOR, %s> ", yytext); return FOR; }
to		{ printf("\n<TO, %s> ", yytext); return TO; }
do		{ printf("\n<DO, %s> ", yytext); return DO; }
let		{ printf("\n<LET, %s> ", yytext); return LET; }
in		{ printf("\n<IN, %s> ", yytext); return IN; }
end		{ printf("\n<END, %s> ", yytext); return END; }
of		{ printf("\n<OF, %s> ", yytext); return OF; }
break		{ printf("\n<BREAK, %s> ", yytext); return BREAK; }
nil		{ printf("\n<NIL, %s> ", yytext); return NIL; }
function	{ printf("\n<FUNCTION, %s> ", yytext); return FUNCTION; }	
var		{ printf("\n<VAR, %s> ", yytext); return VAR; }
type		{ printf("\n<TYPE, %s> ", yytext); return TYPE; }
import		{ printf("\n<IMPORT, %s> ", yytext); return IMPORT; }
primitive	{ printf("\n<PRIMITIVE, %s> ", yytext); return PRIMITIVE; }

","		{ printf("\n<COMMA, %s> ", yytext); return COMMA; }
":"		{ printf("\n<COLON, %s> ", yytext); return COLON; }
";"		{ printf("\n<SEMICOLON, %s> ", yytext); return SEMICOLON; }
"("		{ printf("\n<L_PARENT, %s> ", yytext); return LEFT_PARENT; }
")"		{ printf("\n<R_PARENT, %s> ", yytext); return RIGHT_PARENT; }
"["		{ printf("\n<L_BRACKET, %s> ", yytext); return LEFT_BRACKET; }
"]"		{ printf("\n<R_BRACKET, %s> ", yytext); return RIGHT_BRACKET; }
"{"		{ printf("\n<L_BRACE, %s> ", yytext); return LEFT_BRACE; }
"}"		{ printf("\n<R_BRACE, %s> ", yytext); return RIGHT_BRACE; }
"."		{ printf("\n<DOT, %s> ", yytext); return DOT; }
"+"		{ printf("\n<PLUS, %s> ", yytext); return PLUS; }
"-"		{ printf("\n<MINUS, %s> ", yytext); return MINUS; }
"*"		{ printf("\n<TIMES, %s> ", yytext); return TIMES; }
"/"		{ printf("\n<DIVIDE, %s> ", yytext); return DIVIDE; }
"="		{ printf("\n<EQUAL, %s> ", yytext); return EQUAL; }
"<>"		{ printf("\n<NOT_EQUAL, %s> ", yytext); return NOT_EQUAL; }
"<"		{ printf("\n<LESS, %s> ", yytext); return LESS; }
"<="		{ printf("\n<LESS_EQ, %s> ", yytext); return LESS_EQUAL; }
">"		{ printf("\n<GREATER, %s> ", yytext); return GREATER; }
">="		{ printf("\n<GREATER_EQ, %s> ", yytext); return GREATER_EQUAL; }
"&"		{ printf("\n<AND, %s> ", yytext); return AND; }
"|"		{ printf("\n<OR, %s> ", yytext); return OR; }
":="		{ printf("\n<ASSIGN, %s> ", yytext); return ASSIGN; }

[a-zA-Z][a-zA-Z0-9_]*	{ printf("<ID, %s> ", yytext); return ID; }
[0-9]+			{ printf("<NUMBER, %s> ", yytext); return NUMBER; }
\"(\\.|[^"\\])*\"	{ printf("\n<STRING, %s> ", yytext); return STRING; }


"/*"            { BEGIN(C_COMMENT); }
<C_COMMENT>"*/"	{ BEGIN(INITIAL); }
<C_COMMENT>\n   { } 
<C_COMMENT>.    { ; }

" "	 	{ continue;}
"\n" 		{ printf("\n"); continue; } 
. 		{ printf("Syntax error.");}

%% 
  
int main() 
{    
    // The function that starts the analysis 
    while(yylex()){}; 
  
    return 0; 
} 
