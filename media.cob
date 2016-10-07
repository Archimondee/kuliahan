       IDENTIFICATION DIVISION.
       PROGRAM-ID.  MEDIA.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  VNUMERO.
           02  NUMERO  PIC 9(05)V99 OCCURS 5 TIMES.
       77  C           PIC 9 VALUE 0.
       77  MEDIA       PIC 9(05)V99 VALUE ZEROS.
       77  MAIOR       PIC 9(05)V99 VALUE ZEROS.
       77  LINHA       PIC X(80) VALUE ALL "-".
       01  VDATA.
           02  ANO PIC 9(02) VALUE ZEROS.
           02  MES PIC 9(02) VALUE ZEROS.
           02  DIA PIC 9(02) VALUE ZEROS.
       SCREEN SECTION.
       01  TELA-1.
           02  LINE 01 COLUMN 01 BLANK SCREEN.
           02  LINE 02 COLUMN 28 "Universidade Estacio de Sa".
           02  LINE 03 COLUMN 01 PIC X(80) USING LINHA.
           02  LINE 09 COLUMN 15 VALUE "Digite o  o. Numero:".
           02  LINE 23 COLUMN 01 PIC X(80) USING LINHA.
       01  TELA-2.
           02 LINE 09 COLUMN 01 BLANK LINE.
           02 LINE 15 COLUMN 15 VALUE "Maior Numero......:".
           02 LINE 17 COLUMN 15 VALUE "Media dos Numeros.:".
           02 LINE 15 COLUMN 36 PIC ZZ.ZZ9,99 USING MAIOR.
           02 LINE 17 COLUMN 36 PIC ZZ.ZZ9,99 USING MEDIA.
       PROCEDURE DIVISION.
       010-INICIO.
           ACCEPT VDATA FROM DATE.
           DISPLAY TELA-1.
           DISPLAY (24, 60) "DATA ==> " DIA "/" MES "/" ANO.
       020-LOOP.
      ***********************************************
      * C eh o contador de numeros, varia de 1 a 5  *
      ***********************************************
           ADD 1 TO C.
           DISPLAY (09, 24) C.
           ACCEPT (09, 36) NUMERO(C) WITH PROMPT.
           IF NUMERO(C) > MAIOR
              MOVE NUMERO(C) TO MAIOR.
           ADD NUMERO(C) TO MEDIA.
           IF C < 5 GO 020-LOOP.
       030-FINAL.
           COMPUTE MEDIA ROUNDED = MEDIA / 5.
           DISPLAY TELA-2.
           DISPLAY (24, 01) "TECLE <ENTER> PARA SAIR".
           ACCEPT (24, 32) C.
           IF C = 0
              GO 010-INICIO.
           DISPLAY (01, 01) ERASE.
           DISPLAY (10, 20) "**** FIM DO PROGRAMA ****"
           STOP RUN.
      * ERRO AO EXECUTAR O PROGRAMA NOVAMENTE,
      * VARIAVEIS NAO SÃO INICIALIZADAS.
           