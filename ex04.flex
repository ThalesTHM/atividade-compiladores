import java_cup.runtime.Symbol;
%%

%class Scanner
%unicode
%cup
%line
%column

DIGITO = [0-9]

%%

// Palavras-chave
"GANHA" { return new Symbol(sym.GANHA); }
"PERDE" { return new Symbol(sym.PERDE); }

// Operadores e símbolos
"+"  { return new Symbol(sym.MAIS); }
";"  { return new Symbol(sym.PTVIRG); }

// Números inteiros
{DIGITO}+ { 
      Integer val = Integer.valueOf(yytext()); 
      return new Symbol(sym.INTEIRO, val); 
 }

// Espaços em branco (ignorar)
[ \t\r\n]+ { /* ignora */ }

// Qualquer outro caractere
.  { 
        System.out.println("Caractere inválido: " + yytext()); 
   }
