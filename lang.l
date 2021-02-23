%option noyywrap

%{
	#include <stdio.h>
	#include <string.h>

	void count();
	void print();

	int num_line = 1;
	int num_column = 0;
	int num_lexeme = 0;
%}

type_int 				"int"
type_float 				"float"
type_elem 				"elem"
type_set				"set"
const_empty				"EMPTY"

plus 					"+"
minus 					"-"
mult 					"*"
div 					"/"

new_line				\n
letter					[a-zA-Z_]
digit 					[0-9]
id 						{letter}({letter}|{digit})*
num 					{digit}+
dec 					{digit}+"."{digit}+

eq						"="
or 						"||"
and 					"&&"

clt 					"<"
cle 					"<="
cgt 					">"
cge 					">="
ceq 					"=="
cne 					"!="

exclamation				"!"
semicolon				";"
comma					","
open_parentheses		"("
close_parentheses		")"
open_brace				"{"
close_brace				"}"
str 					\"(\\.|[^"\\])*\"


%%

read {
	count(); 
	print(); 
}

write { 
	count(); 
	print(); 
}

writein {
	count(); 
	print(); 
}

{type_int} {
	count(); 
	print(); 
}

{type_float} { 
	count(); 
	print(); 
}

{type_elem} {
	count(); 
	print(); 
}

{type_set} {
	count(); 
	print(); 
}

{const_empty} { 
	count(); 
	print(); 
}

{plus} {
	count(); 
	print(); 
}

{minus} { 
	count(); 
	print(); 
}

{mult} {
	count(); 
	print(); 
}

{div}	{ 
	count(); 
	print(); 
}

{new_line} { 
	count(); 
}

{num} {
	count(); 
	print(); 
}

{dec}	{ 
	count(); 
	print(); 
}

{eq} {
	count(); 
	print();
}

{or} { 
	count(); 
	print();
}

{and} {
	count(); 
	print(); 
}

{clt} {
	count(); 
	print(); 
}

{cle} { 
	count(); 
	print(); 
}

{cgt} { 
	count(); 
	print(); 
}

{cge} { 
	count(); 
	print(); 
}

{ceq} { 
	count(); 
	print(); 
}

{cne} { 
	count(); 
	print(); 
}

{exclamation} { 
	count(); 
	print(); 
}

{semicolon} {
	count(); 
	print();
}

{comma} {
	count(); 
	print();
}

{open_parentheses} {
	count(); 
	print();
}

{close_parentheses} {
	count(); 
	print();
}

{open_brace} {
	count(); 
	print(); 
}

{close_brace} { 
	count(); 
	print(); 
}

{str} { 
	count(); 
	print(); 
}

\t* {
	count(); 
}

" "* {
	count(); 
}

"if" { 
	count(); 
	print(); 
}

"else" { 
	count(); 
	print(); 
}

"for" { 
	count(); 
	print(); 
}

"return" { 
	count(); 
	print();
}

"in" { 
	count(); 
	print(); 
}

"is_set" { 
	count(); 
	print(); 
}

"add" { 
	count(); 
	print(); 
}

"remove" { 
	count(); 
	print(); 
}


"exists" { 
	count(); 
	print(); 
}

"forall" { 
	count(); 
	print();
}

{id} {
	count(); 
	print();
}

. { 
	printf("Símbolo inválido: \"%s\" Localização: linha %d coluna %d\n", yytext, num_line, num_column);
	count();
}

%%

void count() {
	int num_symbol;

	num_lexeme ++;
	num_symbol = strlen(yytext);
	num_column += num_symbol;
	
	if (!strcmp(yytext, "\n")) {
		num_column = 0;
		num_line ++;
	}
}

void print() {
	printf("Símbolo válido: %s\n", yytext); 
}

int main(int argc, char **argv) {
	++argv, --argc;

	if (argc > 0) {
		yyin = fopen(argv[0], "r");
	} else {
		yyin = stdin;
	}
	yylex();

	return 0;
}
