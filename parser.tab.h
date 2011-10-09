/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     T_BOOL = 258,
     T_INT = 259,
     T_FLOAT = 260,
     T_VEC = 261,
     T_BVEC = 262,
     T_IVEC = 263,
     T_CONST = 264,
     T_RQUAL = 265,
     T_AQUAL = 266,
     T_UQUAL = 267,
     INT = 268,
     BOOL = 269,
     FLOAT = 270,
     IDENT = 271,
     LOOP = 272,
     T_IF = 273,
     T_ELSE = 274,
     FUNC = 275,
     SCOPE = 276,
     BRACE = 277,
     SBRACE = 278,
     OP = 279,
     SEMICOL = 280,
     COMMA = 281,
     DOT = 282
   };
#endif
/* Tokens.  */
#define T_BOOL 258
#define T_INT 259
#define T_FLOAT 260
#define T_VEC 261
#define T_BVEC 262
#define T_IVEC 263
#define T_CONST 264
#define T_RQUAL 265
#define T_AQUAL 266
#define T_UQUAL 267
#define INT 268
#define BOOL 269
#define FLOAT 270
#define IDENT 271
#define LOOP 272
#define T_IF 273
#define T_ELSE 274
#define FUNC 275
#define SCOPE 276
#define BRACE 277
#define SBRACE 278
#define OP 279
#define SEMICOL 280
#define COMMA 281
#define DOT 282




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 57 "parser.y"
{
  int num;
  char* s;
  long lnum;   
}
/* Line 1529 of yacc.c.  */
#line 109 "y.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

