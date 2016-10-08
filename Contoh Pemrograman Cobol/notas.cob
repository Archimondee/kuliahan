       IDENTIFICATION DIVISION.
       PROGRAM-ID.  NOTAS.
      *
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  VARIAVEIS-SISTEMA.
           02  WS-PR1         PIC 9(02)V9 VALUE ZEROS.
           02  WS-PR2         PIC 9(02)V9 VALUE ZEROS.
           02  WS-PF          PIC 9(02)V9 VALUE ZEROS.
           02  WS-MEDIA       PIC 9(02)V9 VALUE ZEROS.
           02  MFINAL         PIC ZZ,Z.
           02  WS-LIMPA       PIC X(30) VALUE SPACES.
           02  RESPOSTA       PIC A.
           02  CODIGO         PIC X(03) VALUE "SIM".
           02  WS-PAUSA       PIC X(01).
       01  WS-DATA.
           02  WS-ANO         PIC 9(02) VALUE ZEROS.
           02  WS-MES         PIC 9(02) VALUE ZEROS.
           02  WS-DIA         PIC 9(02) VALUE ZEROS.
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
               "อออออออออออออออหออออออออออหออออออออออออน".
           02  LINE 23 COLUMN 1  VALUE "บ MENSAGEM บ".
           02  LINE 23 COLUMN 56 VALUE "บ".
           02  LINE 23 COLUMN 67 VALUE "บ".
           02  LINE 23 COLUMN 80 VALUE "บ".
           02  LINE 24 COLUMN 1  VALUE
               "ศออออออออออสออออออออออออออออออออออออออออ".
           02  LINE 24 COLUMN 41 VALUE
               "อออออออออออออออสออออออออออสออออออออออออผ".
           02  LINE 2  COLUMN 25 VALUE
               "*** UNIVERSIDADE ESTACIO DE SA ***".
       01  TELA.
           02  LINE  4 COLUMN 30  VALUE "** CONTROLE DE MEDIAS **".
           02  LINE  6 COLUMN 07  VALUE "PR1 ...................:".
           02  LINE  7 COLUMN 07  VALUE "PR2 ...................:".
           02  LINE 10 COLUMN 07  VALUE "Media .................:".
       01  TELA-COMP1.
           02  LINE  8 COLUMN 07  VALUE "PRF ...................:".
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
       010-INICIO.
           DISPLAY (01, 01) ERASE.
           ACCEPT WS-DATA FROM DATE.
           ACCEPT WS-HORA FROM TIME.
           DISPLAY JANELA.
           DISPLAY TELA.
           DISPLAY (23, 69) WS-DIA "/" WS-MES "/20" WS-ANO.
           DISPLAY (23, 58) WS-HOR ":" WS-MIN ":" WS-SEG.
       020-PREENCHE-NOTAS.
           ACCEPT (06, 32) WS-PR1 WITH PROMPT.
           ACCEPT (07, 32) WS-PR2 WITH PROMPT.
       030-CALCULA-MEDIA.
           COMPUTE WS-MEDIA = (WS-PR1 + WS-PR2)/2.
              MOVE WS-MEDIA TO MFINAL.
              DISPLAY (10, 32) MFINAL.
           IF WS-MEDIA < 7,0 AND WS-MEDIA > 3,9
              DISPLAY TELA-COMP1
              DISPLAY (23, 14) "PROVA FINAL               "
              ACCEPT (08, 32) WS-PF WITH PROMPT
              COMPUTE WS-MEDIA = (WS-MEDIA + WS-PF)/2
              MOVE WS-MEDIA TO MFINAL
              DISPLAY (10, 32) MFINAL.
           IF WS-MEDIA = 7 OR WS-MEDIA > 7
              DISPLAY (23, 14) "APROVADO - Tecle ENTER.   ".
           IF WS-MEDIA < 7
              DISPLAY (23, 14) "REPROVADO - Tecle ENTER.  ".
           ACCEPT (23, 41) WS-PAUSA.
       050-SAIR-OU-NAO.
           DISPLAY (23, 14) "Deseja recalcular? (S/N)  ".
           ACCEPT  (23, 39) RESPOSTA.
           IF RESPOSTA = "N" or "n"
              MOVE "NAO" TO CODIGO
              GO TO 070-FIM
           ELSE IF RESPOSTA = "S" or "s"
              NEXT SENTENCE
           ELSE IF RESPOSTA NOT EQUAL TO "S" or "s" or "N" or "n"
              DISPLAY (23, 14) "Digitar (S/N) ou (s/n):          "
              ACCEPT  (23, 37) RESPOSTA
              DISPLAY (23, 14) "                                 ".
       060-LIMPA-DADOS.
           DISPLAY (06, 32) WS-LIMPA.
           DISPLAY (07, 32) WS-LIMPA.
           DISPLAY (08, 32) WS-LIMPA.
           DISPLAY (10, 32) WS-LIMPA.
           DISPLAY (23, 14) "                                         ".
           GO TO 010-INICIO.
       070-FIM.
           DISPLAY (1, 1) ERASE.
           DISPLAY TELA-FIM.
           STOP RUN.
      ***---------- FIM DO PROGRAMA NOTAS ---------***
