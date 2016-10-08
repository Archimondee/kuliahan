       IDENTIFICATION DIVISION.
       PROGRAM-ID.  EXERCICIO1.
      *
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  VARIAVEIS-SISTEMA.
           02  REAJUSTE       PIC 9(04)V99 VALUE ZEROS.
           02  WS-SAL-REAJ    PIC Z.ZZ9,99.
           02  WS-LIMPA       PIC X(30) VALUE SPACES.
           02  RESPOSTA       PIC A.
           02  CODIGO         PIC X(03) VALUE "SIM".
           02  WS-PAUSA       PIC X(01).
       01  WS-PESSOA.
           02  WS-NOME        PIC X(40) VALUE SPACES.
           02  WS-IDADE       PIC 9(02) VALUE ZEROS.
           02  WS-SEXO        PIC A(01).
           02  WS-SALARIO     PIC 9(04)V99 VALUE ZEROS.
       01  WS-DATA.
           02  WS-DIA         PIC 9(02) VALUE ZEROS.
           02  WS-MES         PIC 9(02) VALUE ZEROS.
           02  WS-ANO         PIC 9(04) VALUE ZEROS.
       01  WS-HORA.
           02  WS-HOR         PIC 9(02) VALUE ZEROS.
           02  WS-MIN         PIC 9(02) VALUE ZEROS.
           02  WS-SEG         PIC 9(02) VALUE ZEROS.
           02  WS-CSE         PIC 9(02) VALUE ZEROS.
       SCREEN SECTION.
       01  JANELA.
           02  BLANK SCREEN.
           02  LINE 1  COLUMN 1  VALUE
               "ษอออออออออออออออออออออออออออออออออออออออ".
           02  LINE 1  COLUMN 41 VALUE
               "อออออออออออออออออออออออออออออออออออออออป".
           02  LINE 2  COLUMN 1  VALUE "บ".
           02  LINE 2  COLUMN 80 VALUE "บ".
           02  LINE 3  COLUMN 1  VALUE
               "ฬอออออออออออออออออออออออออออออออออออออออ".
           02  LINE 3  COLUMN 41 VALUE
               "อออออออออออออออออออออออออออออออออออออออน".
           02  LINE 4  COLUMN 1  VALUE "บ".
           02  LINE 4  COLUMN 80 VALUE "บ".
           02  LINE 5  COLUMN 1  VALUE "บ".
           02  LINE 5  COLUMN 80 VALUE "บ".
           02  LINE 6  COLUMN 1  VALUE "บ".
           02  LINE 6  COLUMN 80 VALUE "บ".
           02  LINE 7  COLUMN 1  VALUE "บ".
           02  LINE 7  COLUMN 80 VALUE "บ".
           02  LINE 8  COLUMN 1  VALUE "บ".
           02  LINE 8  COLUMN 80 VALUE "บ".
           02  LINE 9  COLUMN 1  VALUE "บ".
           02  LINE 9  COLUMN 80 VALUE "บ".
           02  LINE 10 COLUMN 1  VALUE "บ".
           02  LINE 10 COLUMN 80 VALUE "บ".
           02  LINE 11 COLUMN 1  VALUE "บ".
           02  LINE 11 COLUMN 80 VALUE "บ".
           02  LINE 12 COLUMN 1  VALUE "บ".
           02  LINE 12 COLUMN 80 VALUE "บ".
           02  LINE 13 COLUMN 1  VALUE "บ".
           02  LINE 13 COLUMN 80 VALUE "บ".
           02  LINE 14 COLUMN 1  VALUE "บ".
           02  LINE 14 COLUMN 80 VALUE "บ".
           02  LINE 15 COLUMN 1  VALUE "บ".
           02  LINE 15 COLUMN 80 VALUE "บ".
           02  LINE 16 COLUMN 1  VALUE "บ".
           02  LINE 16 COLUMN 80 VALUE "บ".
           02  LINE 17 COLUMN 1  VALUE "บ".
           02  LINE 17 COLUMN 80 VALUE "บ".
           02  LINE 18 COLUMN 1  VALUE "บ".
           02  LINE 18 COLUMN 80 VALUE "บ".
           02  LINE 19 COLUMN 1  VALUE "บ".
           02  LINE 19 COLUMN 80 VALUE "บ".
           02  LINE 20 COLUMN 1  VALUE "บ".
           02  LINE 20 COLUMN 80 VALUE "บ".
           02  LINE 21 COLUMN 1  VALUE "บ".
           02  LINE 21 COLUMN 80 VALUE "บ".
           02  LINE 22 COLUMN 1  VALUE
               "ฬออออออออออหออออออออออออออออออออออออออออ".
           02  LINE 22 COLUMN 41 VALUE
               "ออออออออออออออออหอออออออออหออออออออออออน".
           02  LINE 23 COLUMN 1  VALUE "บ MENSAGEM บ".
           02  LINE 23 COLUMN 57 VALUE "บ".
           02  LINE 23 COLUMN 67 VALUE "บ".
           02  LINE 23 COLUMN 80 VALUE "บ".
           02  LINE 24 COLUMN 1  VALUE
               "ศออออออออออสออออออออออออออออออออออออออออ".
           02  LINE 24 COLUMN 41 VALUE
               "ออออออออออออออออสอออออออออสออออออออออออผ".
           02  LINE 2  COLUMN 26 VALUE "*** CONSISTENCIA DE DADOS ***".
       01  ENTRAR-DATA.
           02  LINE 10 COLUMN 10  VALUE "Informe a data atual:".
           02  LINE 11 COLUMN 11  VALUE " Formato (DDMMYYYY)  ".
       01  TELA.
           02  LINE  6 COLUMN 07  VALUE "Nome ..................:".
           02  LINE  7 COLUMN 07  VALUE "Idade .................:".
           02  LINE  7 COLUMN 42  VALUE "(>14 e <30)".
           02  LINE  8 COLUMN 07  VALUE "Sexo ..................:".
           02  LINE  8 COLUMN 42  VALUE "(F/M)".
           02  LINE  9 COLUMN 07  VALUE "Salario ...............:".
           02  LINE  9 COLUMN 42  VALUE "(>1000 e <5000)".
       01  TELA-REAJUSTE.
           02  LINE 11 COLUMN 07  VALUE "Salario Reajustado ....:".
           02  LINE 11 COLUMN 42  VALUE "(Reajuste de 25%)".           
       01  TELA-FIM.
           02  BLANK SCREEN.
           02  LINE 10 COLUMN 20  VALUE
               "ษออออออออออออออออออออออออออออออออออออออป  ".
           02  LINE 11 COLUMN 20  VALUE
               "บ                                      บฒฒ".
           02  LINE 12 COLUMN 20  VALUE
               "บ           Desenvolvido por           บฒฒ".
           02  LINE 13 COLUMN 20 VALUE
               "บ                                      บฒฒ".
           02  LINE 14 COLUMN 20  VALUE
               "บ       Andre Veloso de Mesquita       บฒฒ".
           02  LINE 15 COLUMN 20  VALUE
               "บ                                      บฒฒ".
           02  LINE 16 COLUMN 20  VALUE
               "ศออออออออออออออออออออออออออออออออออออออผฒฒ".
           02  LINE 17 COLUMN 20  VALUE
               "  ฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒฒ".
       PROCEDURE DIVISION.
      *----------------------------------------------------
       001-INICIO.
           DISPLAY (01, 01) ERASE.
           ACCEPT WS-HORA FROM TIME.
      *----------------------------------------------------
       002-ENTRA-DATA.
           DISPLAY ENTRAR-DATA.
           ACCEPT (10, 32) WS-DATA WITH PROMPT.
           DISPLAY (23, 14) "                                        
      -                     "                                       ".
           IF WS-DATA = ZEROS OR WS-DATA = SPACES OR WS-DATA = 0 OR
              WS-DATA = 00 OR WS-DATA = 000 OR WS-DATA = 0000 OR
              WS-DATA = 00000 OR WS-DATA = 000000 OR WS-DATA = 0000000
              OR WS-DATA = 00000000 OR WS-DATA = 000000000 OR
              WS-DATA = 0000000000
              DISPLAY (23, 14) "DATA INVALIDA! Reinforme"
              GO 002-ENTRA-DATA.
      ***** TESTA MES
           IF WS-MES < 0 OR WS-MES > 12
              DISPLAY (23, 14) "ANO POSSUI ENTRE 1 E 12 MESES!
      -                        " Reinforme."
              GO 002-ENTRA-DATA.
      ***** TESTA ANO
           IF WS-ANO < 2002
              DISPLAY (23, 14) "ANO RETROATIVO NAO PERMITIDO!
      -                        " Reinforme."
              GO 002-ENTRA-DATA.
      ***** TESTA DIAS E MESES
           IF WS-MES = 2
              IF WS-DIA < 0 OR WS-DIA > 29
                 DISPLAY (23, 14) "MES POSSUI ENTRE 1 E 29 DIAS.
      -                          " Reinforme."
                 GO 002-ENTRA-DATA.
           IF WS-MES = 1 OR WS-MES = 3 OR WS-MES = 5 OR WS-MES = 7 OR
              WS-MES = 8 OR WS-MES = 10 OR WS-MES = 12     
                 IF WS-DIA < 0 OR WS-DIA > 31
                 DISPLAY (23, 14) "MES POSSUI ENTRE 1 E 31 DIAS.
      -                           " Reinforme."
                 GO 002-ENTRA-DATA.
           IF WS-MES = 4 OR WS-MES = 6 OR WS-MES = 9 OR WS-MES = 11
              IF WS-DIA < 0 OR WS-DIA > 30
              DISPLAY (23, 14) "MES POSSUI ENTRE 1 E 30 DIAS.
   -                           " Reinforme."
              GO 002-ENTRA-DATA.
      *----------------------------------------------------
       010-INICIALIZA-SISTEMA.
           DISPLAY (01, 01) ERASE.
           DISPLAY JANELA.
           DISPLAY (23, 69) WS-DIA "/" WS-MES "/" WS-ANO.
           DISPLAY (23, 60) WS-HOR ":" WS-MIN.
      *----------------------------------------------------
       020-TELA.
           DISPLAY TELA.
      *----------------------------------------------------
       030-RECEBE-NOME.
           ACCEPT (06, 32) WS-NOME WITH PROMPT.
      *----------------------------------------------------
       040-RECEBE-IDADE.
           ACCEPT (07, 32) WS-IDADE WITH PROMPT.
           IF WS-IDADE < 15 OR WS-IDADE > 29
              DISPLAY (23, 14) "IDADE INVALIDA! Reinforme."
              GO 040-RECEBE-IDADE.
           DISPLAY (23, 14) "                           ".
      *----------------------------------------------------
       050-RECEBE-SEXO.
           ACCEPT (08, 32) WS-SEXO WITH PROMPT.
           IF WS-SEXO NOT= "F" AND WS-SEXO NOT= "M" AND 
              WS-SEXO NOT= "f" AND WS-SEXO NOT= "m"
              DISPLAY (23, 14) "SEXO INVALIDO! Reinforme."
              GO 050-RECEBE-SEXO.
           DISPLAY (23, 14) "                         ".
      *----------------------------------------------------
       060-RECEBE-SALARIO.
           ACCEPT (09, 32) WS-SALARIO WITH PROMPT.
           IF WS-SALARIO < 1000,01 OR WS-SALARIO > 4999,99
              DISPLAY (23, 14) "SALARIO INVALIDO! Reinforme."
              GO 060-RECEBE-SALARIO.
           DISPLAY (23, 14) "                            ".
      *----------------------------------------------------
       070-CALCULA-REAJUSTE.
           COMPUTE REAJUSTE = WS-SALARIO + (WS-SALARIO * 0,25).
           MOVE REAJUSTE TO WS-SAL-REAJ.
           DISPLAY TELA-REAJUSTE.
           DISPLAY (11, 32) WS-SAL-REAJ.
      *----------------------------------------------------
       080-SAIR-OU-NAO.
           DISPLAY (23, 14) "Deseja recalcular? (S/N)  ".
           ACCEPT  (23, 39) RESPOSTA.
           IF RESPOSTA = "N" or "n"
              MOVE "NAO" TO CODIGO
              GO TO 100-FIM
           ELSE IF RESPOSTA = "S" or "s"
              NEXT SENTENCE
           ELSE IF RESPOSTA NOT EQUAL TO "S" or "s" or "N" or "n"
              DISPLAY (23, 14) "Digitar (S/N) ou (s/n):          "
              ACCEPT  (23, 37) RESPOSTA
              DISPLAY (23, 14) "                                 ".
      *----------------------------------------------------
       090-LIMPA-DADOS.
           DISPLAY (06, 32) WS-LIMPA.
           DISPLAY (07, 32) WS-LIMPA.
           DISPLAY (08, 32) WS-LIMPA.
           DISPLAY (10, 32) WS-LIMPA.
           DISPLAY (23, 14) "                                        ".
           GO TO 010-INICIALIZA-SISTEMA.
      *----------------------------------------------------
       100-FIM.
           DISPLAY (1, 1) ERASE.
           DISPLAY TELA-FIM.
           STOP RUN.
      ***---------- FIM DO PROGRAMA EXERCICIO1 ---------***
