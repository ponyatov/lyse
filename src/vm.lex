%{
    #include "vm.hpp"
    char *yyfile = nullptr;
%}

%option noyywrap yylineno

%%
"%%"[^\n]*  {}  // line comment
[ \t\r\n]+  {}  // drop spaces

"module"    {return MODULE;}

[0-9]+              {yylval.n = atoi(yytext);            return INT ;}
[a-z_][a-z_0-9]*    {yylval.s = new std::string(yytext); return ATOM;}

"{"         {yylval.c = yytext[0]; return LC   ;}
"}"         {yylval.c = yytext[0]; return RC   ;}
"."         {yylval.c = yytext[0]; return DOT  ;}
","         {yylval.c = yytext[0]; return COMMA;}
.           {yylval.c = yytext[0]; return CHAR ;}
