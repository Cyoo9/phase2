%{
 int lineNum = 1;
 int columnNum = 0;
%}

   /* some common rules */
digit [0-9]
%%
   /* specific lexer rules in regex */
"function" {printf("FUNCTION\n"); columnNum++;}
"beginparams" {printf("BEGIN_PARAMS\n"); columnNum++;}
"endparams" {printf("END_PARAMS\n"); columnNum++;}
"beginlocals" {printf("BEGIN_LOCALS\n"); columnNum++;}
"endlocals" {printf("END_LOCALS\n"); columnNum++;}
"beginbody" {printf("BEGIN_BODY\n"); columnNum++;}
"endbody" {printf("END_BODY\n"); columnNum++;}
"integer" {printf("INTEGER\n");columnNum++;}
"array" {printf("ARRAY\n"); columnNum++;}
"of" {printf("OF\n"); columnNum++;}
"if" {printf("IF\n");columnNum++;}
"then" {printf("THEN\n");columnNum++;}
"endif" {printf("ENDIF\n");columnNum++;}
"else" {printf("ELSE\n");columnNum++;}
"while" {printf("WHILE\n");columnNum++;}
"do" {printf("DO\n");columnNum++;}
"beginloop" {printf("BEGINLOOP\n");columnNum++;}
"endloop" {printf("ENDLOOP\n");columnNum++;}
"continue" {printf("CONTINUE\n");columnNum++;}
"break" {printf("BREAK\n");columnNum++;}
"read" {printf("READ\n");columnNum++;}
"write" {printf("WRITE\n");columnNum++;}
"not" {printf("NOT\n");columnNum++;}
"true" {printf("TRUE\n");columnNum++;}
"false" {printf("FALSE\n");columnNum++;}
"return" {printf("RETURN\n");columnNum++;}
"+" {printf("ADD\n");columnNum++;}
{digit}+ {printf("NUMBER %s\n", yytext);columnNum++;}
"-" {printf("SUB\n");columnNum++;}
"*" {printf("MULT\n");columnNum++;}
"/" {printf("DIV\n");columnNum++;}
"%" {printf("MOD\n");columnNum++;}
"==" {printf("EQ\n");columnNum++;}
"<>" {printf("NEQ\n");columnNum++;}
"<" {printf("LT\n");columnNum++;}
">" {printf("GT\n");columnNum++;}
"<=" {printf("LTE\n");columnNum++;}
">=" {printf("GTE\n");columnNum++;}
";" {printf("SEMICOLON\n");columnNum++;}
":" {printf("COLON\n");columnNum++;}
"," {printf("COMMA\n");columnNum++;}
"(" {printf("L_PAREN\n");columnNum++;}
")" {printf("R_PAREN\n");columnNum++;}
"[" {printf("L_SQUARE_BRACKET\n");columnNum++;}
"]" {printf("R_SQUARE_BRACKET\n");columnNum++;}
":=" {printf("ASSIGN\n");columnNum++;}
##.+ {printf("");columnNum++;}
[a-zA-Z]+[_a-zA-Z0-9]+[a-zA-Z0-9]+  { printf("IDENT %s\n", yytext);columnNum++;}
[0-9][a-zA-Z]+[_a-zA-Z0-9]+[a-zA-Z0-9]+ {printf("Error at line %d, column %d: identifier \"%s\" must begin with a letter\n", lineNum, columnNum, yytext); exit(1);} 
[0-9][a-zA-Z]+[a-zA-Z0-9]* {printf("Error at line %d, column %d: identifier \"%s\" must begin with a letter\n", lineNum, columnNum, yytext); exit(1);} 
_[a-zA-Z]+[_a-zA-Z0-9]+[a-zA-Z0-9]+  { printf("Error at line %d, column %d: identifier \"%s\" cannot begin with an underscore\n", lineNum, columnNum, yytext); exit(1);}
_[a-zA-Z]+[a-zA-Z0-9]*  { printf("Error at line %d, column %d: identifier \"%s\" cannot begin with an underscore\n", lineNum, columnNum, yytext); exit(1);}
[a-zA-Z]+[_a-zA-Z0-9]+[a-zA-Z0-9]+_  { printf("Error at line %d, column %d: identifier \"%s\" cannot end with an underscore\n", lineNum, columnNum, yytext); exit(1);}
[a-zA-Z]+[a-zA-Z0-9]*_  { printf("Error at line %d, column %d: identifier \"%s\" cannot end with an underscore\n", lineNum, columnNum, yytext); exit(1);}
"\n" {lineNum += 1; columnNum = 0; printf("");} 
[!$^&_|~=`?./] {printf("Error at line %d, column %d: unrecognized symbol \"%s\"\n", lineNum, columnNum, yytext); exit(1);} 
[ \t] { }

%%
	/* C functions used in lexer */

int main(int argc, char ** argv)
{
  
   yylex();
}

