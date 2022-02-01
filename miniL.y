    /* cs152-miniL phase2 */
%{
extern int yylex(); 
void yyerror(const char *msg);
char *identToken;
int numberToken;

%}


%union{
  /* put your types here */
	char *op_val;
}
%define parse.error verbose
%locations
%start prog_start
%token FUNCTION 
%token BEGIN_PARAMS
%token END_PARAMS
%token BEGIN_LOCALS
%token END_LOCALS
%token BEGIN_BODY 
%token END_BODY
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
%token <op_val> NUMBER
%token <op_val> IDENT
%type <op_val> symbol

/* %start program */

%% 

  /* write your rules here */
prog_start: functions { printf("prog_start -> functions\n"); };

functions: %empty { printf("functions -> epsilon\n"); } 
| function functions { printf("functions -> function functions"); };

function: FUNCTION IDENT SEMICOLON BEGIN_PARAMS declarations END_PARAMS BEGIN_LOCALS declarations END_LOCALS BEGIN_BODY statements END_BODY
{ printf("function -> FUNCTION IDENT SEMICOLON BEGIN_PARAMS declarations END_PARAMS BEGIN_LOCALS declarations END_LOCALS BEGIN_BODY statements END_BODY\n"); };

declarations: %empty { printf("declarations -> epsilon\n"); } 
| declaration SEMICOLON declarations { printf("declarations -> declaration SEMICOLON declarations\n"); };

declaration: identifiers COLON INTEGER {  printf("declaration -> identifiers COLON INTEGER\n"); };

identifiers: identifier { printf("identifiers -> ident\n"); };

identifier: IDENT { printf("ident -> IDENT%s\n", yylval.op_val); };

statements: 
statement SEMICOLON
{
  printf("statements -> statement ;\n");
}
| statement SEMICOLON statements
{
  printf("statements -> statement ; statements\n");
};

statements:
statement SEMICOLON
{
  printf("statements -> statement ;\n");
}
| statement SEMICOLON statements
{
  printf("statements -> statement ; statements\n");
};

statement:
IDENT ASSIGN symbol ADD symbol
{
  printf("statement -> IDENT := symbol + symbol\n");
}
| IDENT ASSIGN symbol SUB symbol
{
  printf("statement -> IDENT := symbol - symbol\n");
}
| IDENT ASSIGN symbol MULT symbol
{
  printf("statement -> IDENT := symbol * symbol\n");
}
| IDENT ASSIGN symbol DIV symbol
{
  printf("statement -> IDENT := symbol / symbol\n");
}
| IDENT ASSIGN symbol MOD symbol
{
  printf("statement -> IDENT := symbol %% symbol\n");
}

| IDENT ASSIGN symbol
{
  printf("statement -> IDENT := symbol\n");
}

| WRITE IDENT
{
  printf("statement -> WRITE IDENT\n");
}
;

symbol:
IDENT
{
  printf("symbol -> IDENT %s\n", $1);
  $$ = $1;
}
| NUMBER
{
  printf("symbol -> NUMBER %s\n", $1);
  $$ = $1;
}

%% 

int main(int argc, char **argv) {
   yyparse();
   return 0;
}

void yyerror(const char *msg) {
    /* implement your error handling */
}
