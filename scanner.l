%{
/**********************************************************************
*
* **GROUP INFO**
*  Karan Patel 996173359 
*	Sergey Korobkov 996042982
* 
*
*  Interface to the scanner module for CSC467 course project
**********************************************************************/


#include "common.h"
#include "parser.tab.h"
#include "string.h"


#define YY_USER_INIT { yyin = inputFile; }
#define	yyinput      input
#define yTRACE(x)    { if (traceScanner) fprintf(traceFile, "TOKEN %3d : %s\n", x, yytext); }
#define yERROR(x)    { fprintf(errorFile, "\nLEXICAL ERROR, LINE %d: %s\n", yyline, x); errorOccurred = TRUE;  }

int CheckInt(void);
int yyline = 1;

%}
%option noyywrap

WS          [ \t\n]
digit       [0-9]
letter      [A-Za-z]
alpha       [_] 
false       "false"
true        "true"
sign        [\+\-]
l_int		((\-|\+|\s)?(([1-9][0-9]*)|0))
l_float		((\-|\+|\s)?(((0|[1-9])[1-9]*)?[.][0-9][0-9]*))

%%
{WS}	{}
"/*"        {
	int c1      = 0;
	int c2      = yyinput();
	int curline = yyline;
	for(;;) {
		if (c2 == EOF) {
			fprintf(errorFile, "\nLEXICAL ERROR, LINE %d: Unmatched /*\n", curline);
			errorOccurred = TRUE;
			yyterminate();
		}
		if (c1 == '*' && c2 == '/')
			break;
		c1 = c2;
		c2 = yyinput();
		if (c1 == '\n' && c2 != EOF)
			yyline++;
	}
}
"bool" 	{
	yTRACE(T_BOOL);
	return T_BOOL;
}
"int"  	{
	yTRACE(T_INT);
	return T_INT;
} 
"float"	{
	yTRACE(T_FLOAT);
	return T_FLOAT; 	
} 
"vec"[234]	{
	yTRACE(T_VEC);
	return T_VEC; 
}
"bvec"[234]  {
	yTRACE(T_BVEC);
	return T_BVEC;
} 
"ivec"[234]  {
	yTRACE(T_IVEC);
	return T_IVEC;
	
}
"const"	{
	yTRACE(T_CONST);
	return T_CONST;
}

"gl_FragColor"|"gl_FragDepth"|"gl_FragCoord"	{
	yTRACE(T_RQUAL);
	return T_RQUAL;
}
"gl_TexCoord"|"gl_Color"|"gl_Secondary"|"gl_FogFragCoord"	{
	yTRACE(T_AQUAL);
	return T_AQUAL;
}
"gl_Light_Half"|"gl_Light_Ambient"|"gl_Material_Shininess"|"env1"|"env2"|"env3"	{
	yTRACE(T_UQUAL);
	return T_UQUAL;
}

{false}|{true} { 
	yylval.num = (strcmp(yytext,"false")) ? 1 : 0 ; 
	yTRACE(BOOL);
	return BOOL;
}

{l_int} {  
	yylval.num = atoi(yytext); 
	if (	(yylval.num > 32767)	||	(yylval.num < -32767)	) {
		yERROR(yytext);
	} 
	else {
		yTRACE(INT);
		return INT;
	}
}

{l_float} {
	yylval.lnum = atof(yytext); 
	yTRACE(FLOAT);
	return FLOAT; 
}

"while"	{
	yTRACE(LOOP);
	return LOOP; 
}

"if"	{
	yTRACE(T_IF);
	return T_IF; 	
}

"else"	{
	yTRACE(T_ELSE);
	return T_ELSE; 
}

"dp3"|"lit"|"rsq"	{
	yTRACE(FUNC);
	return FUNC; 
}

(\{|\})	{
	yTRACE(SCOPE);
	return SCOPE; 
}

(\(|\))	{
	yTRACE(BRACE);
	return BRACE; 
}

(\[|\])	{
	yTRACE(SBRACE);
	return SBRACE; 
}

(\=|\+|\-|\*|\/|\^|\!|&&|\|\||\=\=|\!\=|\<|\<\=|\>|\>\=)	{
	yTRACE(OP);
	return OP; 
}

\;	{
	yTRACE(SEMICOL);
	return SEMICOL; 	
}
\,	{
	yTRACE(COMMA);
	return COMMA; 		
}
\.	{
	yTRACE(DOT);
	return DOT; 	
}

((_|{letter})({digit}|{letter}|_)*) {
	yTRACE(IDENT);
	return IDENT; 
}

.	{ 
	yERROR("Unknown token"); 
}

