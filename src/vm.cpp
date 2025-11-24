#include "vm.hpp"

int main(int argc, char *argv[]) {  //
    arg(0, argv[0]);
    for (int i = 1; i < argc; i++) {  //
        arg(i, argv[i]);
        yyfile = argv[i];
        assert(yyin = fopen(yyfile, "r"));
        yyparse();
        fclose(yyin);
        yyfile = nullptr;
    }
    return 0;
}

void arg(int argc, char *argv) {  //
    std::clog << "arg[" << argc << "] = <" << argv << ">\n";
}

void yyerror(const char *msg) {             //
    std::cerr << "\n\n"                     //
              << yyfile << ':' << yylineno  //
              << ' ' << msg << " ["         //
              << yytext << "]\n\n";         //
    exit(-1);
}

Object::Object() : ref(0) {}
Object::Object(std::string *V) : Object() { value = *V; }
Object::~Object() { assert(!ref); }

std::string Object::dump() { return head(); }
std::string Object::head() { return tag() + ':' + val(); }

std::string Object::val() { return value; }

#include <cxxabi.h>

std::string Object::tag() const {
    std::string ret =
        abi::__cxa_demangle(typeid(*this).name(), NULL, NULL, nullptr);
    for (char &c : ret) c = tolower(c);
    return ret;
}

Module::Module(std::string *V) : Object(V) {}
