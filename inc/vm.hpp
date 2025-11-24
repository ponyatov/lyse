#pragma once

#include <iostream>

#include "nif.hpp"

/// @defgroup vm vm
/// @brief Erlang VM
/// @{

extern int main(int argc, char *argv[]);
extern void arg(int argc, char *argv);
/// @}

/// @defgroup syntax syntax
/// @{

extern int yylex();
extern int yylineno;
extern char *yytext;
extern char *yyfile;
extern int yyparse();
extern void yyerror(const char *msg);

/// @}
