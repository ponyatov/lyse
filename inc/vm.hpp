#pragma once

#include <cassert>
#include <iostream>

#include "nif.hpp"

/// @defgroup vm vm
/// @brief Erlang VM
/// @{

/// @defgroup main main
/// @{
extern int main(int argc, char *argv[]);
extern void arg(int argc, char *argv);
/// @}
/// @}

/// @defgroup object object
/// @brief object graph
/// @ingroup vm
/// @{

class Object {
    uint ref;
    std::string value;

   public:
    Object();
    Object(std::string *V);
    virtual ~Object();
    virtual std::string tag() const;
    virtual std::string val();
    std::string head();
    std::string dump();
};

class Module : public Object {
   public:
    Module(std::string *V);
};

/// @}

/// @defgroup syntax syntax
/// @{

extern int yylex();
extern int yylineno;
extern char *yytext;
extern char *yyfile;
extern FILE *yyin;
extern int yyparse();
extern void yyerror(const char *msg);
#include "vm.yacc.hpp"

/// @}
