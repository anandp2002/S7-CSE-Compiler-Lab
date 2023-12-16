//Run Lex code

  1) lex file_name.l
  2) gcc lex.yy.c
  3) ./a.out



 //Run Yacc code

   1) lex lex_file_name.l
   2) yacc -d yacc_file_name.y
   3) gcc lex.yy.c y.tab.c -w
   4) ./a.out
