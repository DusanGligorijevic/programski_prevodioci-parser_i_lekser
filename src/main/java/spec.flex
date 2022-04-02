import java_cup.runtime.Symbol;
%%
// declaration section
%class MPLexer
%cup
%function next_token
%line
%column
%debug
%type Symbol
%eofval{
return new Symbol( Sym.EOF );
%eofval}

%{
//extra class members
KWTable kwTable = new KWTable();
Symbol getKW()
{
return new Symbol( kwTable.find( yytext() ));
}
%}

//states
%state COMMENT
//macros
slovo = [a-zA-Z]
cifra = [0-9]
x2 = [0-1]
x8 = [0-7]
x16 = [0-9a-fA-F]

%%
// rules section
\/\*\* { yybegin( COMMENT ); }
<COMMENT>~\*\/ { yybegin( YYINITIAL ); }

[\t\n\r ] { ; }
\( { return new Symbol( Sym.LP ); }
\) { return new Symbol( Sym.RP ); }
\{ { return new Symbol( Sym.LCB ); }
\} { return new Symbol( Sym.RCB ); }
\[ { return new Symbol( Sym.LB ); }
\] { return new Symbol( Sym.RB ); }
\& { return new Symbol( Sym.EPSILON); }
//operators


\+ { return new Symbol( Sym.PLUS ); }
\* { return new Symbol( Sym.MUL ); }
\- { return new Symbol( Sym.MIN ); }
\/  { return new Symbol( Sym.DIV ); }




//separators
; { return new Symbol( Sym.SEMI ); }
, { return new Symbol( Sym.COMMA ); }
= { return new Symbol( Sym.ASSIGN ); }

//key words
{slovo}+ { return getKW(); }
//id-s
({slovo} | _)({slovo}|{cifra}| _ )* { return new Symbol( Sym.ID, new String( yytext())); }
//constants
{cifra}+ { return new Symbol( Sym.CONST, new Integer( yytext() ) ); }

#{x16}+ { return new Symbol( Sym.CONST, new String( yytext() ) ); }

0\.{cifra}+(E[+\-]{cifra}+)? { return new Symbol( Sym.CONST, new Float( yytext() ));}

'[^]' { return new Symbol( Sym.CONST, new Character( yytext().charAt(1) ) ); }

//error symbol
. { System.out.println( "ERROR: " + yytext() ); }