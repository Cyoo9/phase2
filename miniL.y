    /* cs152-miniL phase2 */
%{
void yyerror(const char *msg);
%}


%union{
  /* put your types here */

}
%error-verbose
%locations

%token FUNCTION 
%token BEGIN_PARAMS
%token END_PARAMS
%token BEGIN_LOCALS
%token END_LOCALS
%token BEGIN_BODY 
%token INTEGER
%token ARRAY 
%token OF 
%token IF
%token THEN
%token ENDIF
%token ELSE 
%token WHILE 
%token DO 
%token BEGINLOOP
%token ENDLOOP
%token CONTINUE
%token BREAK
%token WRITE
%token NOT
%token TRUE
%token FALSE
%token RETURN 
%token ADD 
%token NUMBER 
%token SUB
%token MULT
%token DIV
%token MOD
%token EQ
%token NEQ
%token LT
%token GT
%token LTE
%token GTE
%token SEMICOLON
%token COLON
%token COMMA
%token L_PAREN
%token R_PAREN
%token L_SQUARE_BRACKET
%token R_SQUARE_BRACKET
%token ASSIGN

/* %start program */

%% 

  /* write your rules here */

%% 

int main(int argc, char **argv) {
   yyparse();
   return 0;
}

void yyerror(const char *msg) {
    /* implement your error handling */
}
