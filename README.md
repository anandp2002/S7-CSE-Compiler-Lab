//Run Lex code

  lex file_name.l
  gcc lex.yy.c
  ./a.out



 //Run Yacc code

   lex lex_file_name.l
   yacc -d yacc_file_name.y
   gcc lex.yy.c y.tab.c -w
   ./a.out
