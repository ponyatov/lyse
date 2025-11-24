%{
    #include "vm.hpp"
%}

%defines %union { char c; std::string *s; int n; Module *module; }

%token<c> CHAR DOT COMMA LC RC
%token<s> ATOM
%token<n> INT

%token MODULE
%type<module> module

%%
syntax: | syntax ex

ex  : CHAR  { std::clog <<  "char:" <<  $1 << '\n'; }
    | LC    { std::clog <<    "lc:" <<  $1 << '\n'; }
    | RC    { std::clog <<    "rc:" <<  $1 << '\n'; }
    | DOT   { std::clog <<   "dot:" <<  $1 << '\n'; }
    | COMMA { std::clog << "comma:" <<  $1 << '\n'; }
    | ATOM  { std::clog <<  "atom:" << *$1 << '\n'; }
    | INT   { std::clog <<   "int:" <<  $1 << '\n'; }
    | module { std::clog << $1->dump() << '\n'; }

module: LC MODULE COMMA ATOM RC DOT { $$ = new Module($4); }
