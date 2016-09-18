%{
FILE *f;
int fl=0;
%}


Semicolon			;
Integer				{Digit}+
Float				{Integer}+\.{Integer}+
Keyword				(if|else|while|for|bool|char|int|float)
Identifier			[a-zA-Z_]+[a-zA-Z0-9_]*
Assignment			=
Comparison			(==|<|>|<=|>=)
Operator			(\+|-|\*|\/|%)
OpenBracket			\{
CloseBracket		\}
OpenParen			\(
CloseParen			\)
Digit				[0-9]
Space				\ +
alpha				[a-zA-Z]
EndLine				\n
Comma				\,
Tab					\t
suc					^[[0-9]+\.[a-zA-Z][a-zA-Z0-9]+]
wro					{Digit}+"."+.*{alpha}+.
ko					({Digit}+{alpha}+.*)
Comment				(\/\/.*|[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/])
%%
{Float}		fprintf(f,"Float\n%s\n",yytext);
{Integer}	fprintf(f,"Integer\n%s\n", yytext);
{Keyword}	fprintf(f,"Keyword\n%s\n",yytext);
{Identifier}	fprintf(f,"Identifier\n%s\n",yytext);
{Assignment}	fprintf(f,"Assignment\n%s\n",yytext);
{Comparison}	fprintf(f,"Comparison\n%s\n",yytext);
{Operator}		fprintf(f,"Operator\n%s\n",yytext);
{OpenBracket}   fprintf(f,"Open-bracket\n%s\n",yytext);
{CloseBracket}  fprintf(f,"Close-bracket\n%s\n",yytext);
{OpenParen}		fprintf(f,"Open-paren\n(\n");
{CloseParen}	fprintf(f,"Close-paren\n)\n");
{Semicolon}	fprintf(f,"Semicolon\n;\n");
{suc}		printf("Success\n");
{wro}		{fl=1;}
{ko}		{fl=1;}
		
{Space}			{}
{Tab}		{}
{Comment}	{}
{EndLine}	{}
%%

main(int argc, char *argv[])
{
yyin = fopen(argv[1], "r");


f = fopen("flex_output.txt", "w");
  
  yylex();
if(fl==0)
	printf("Success\n");
else
	printf("Invalid program\n");
}

