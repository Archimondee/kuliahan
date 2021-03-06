{\rtf1\ansi\deff0\deftab720{\fonttbl{\f0\fswiss MS Sans Serif;}{\f1\froman\fcharset2 Symbol;}{\f2\fmodern\fcharset1 Courier New;}{\f3\fmodern\fcharset1 Courier New;}}
{\colortbl\red0\green0\blue0;}
\deflang1046\pard\plain\f3\fs20        IDENTIFICATION DIVISION.
\par        PROGRAM-ID. PROG1.
\par       *
\par        ENVIRONMENT DIVISION.
\par        CONFIGURATION SECTION.
\par        SPECIAL-NAMES.
\par                    DECIMAL-POINT IS COMMA.
\par                    PRINTER IS LPT1.
\par       *
\par        DATA DIVISION.
\par        WORKING-STORAGE SECTION.
\par        77 ALTURA    PIC 9(04)V99 VALUE ZEROS.
\par        77 BASE      PIC 9(04)V99 VALUE ZEROS.
\par        77 HAREA     PIC Z.ZZ9,99.
\par        77 RESPOSTA  PIC A.
\par        77 CODIGO    PIC X(03)    VALUE "SIM".
\par        77 MENS      PIC X(25)    VALUE SPACES.
\par        77 MSG-LIMPA PIC X(25)    VALUE SPACES.
\par       *
\par        SCREEN SECTION
\par        01 TELA.
\par             02 BLANK SCREEN.
\par             02 LINE 1  COLUMN 1  VALUE
\par                "----------------------------------------".
\par             02 LINE 1  COLUMN 41 VALUE
\par                "----------------------------------------".
\par             02 LINE 2  COLUMN 25 VALUE
\par                "*** UNIVERSIDADE ESTACIO DE SA ***".
\par             02 LINE 3  COLUMN 1  VALUE
\par                "----------------------------------------".
\par             02 LINE 3  COLUMN 41 VALUE
\par                "----------------------------------------".
\par             02 LINE 5  COLUMN 25 VALUE
\par                "ENTRE COM O VALOR DA ALTURA..=".
\par             02 LINE 7  COLUMN 25 VALUE
\par                "ENTRE COM O VALOR DA BASE....=".
\par             02 LINE 9  COLUMN 25 VALUE
\par                "RESULTADO DO CALCULO DA AREA =".
\par             02 LINE 22 COLUMN 1  VALUE
\par                "----------------------------------------".
\par             02 LINE 22 COLUMN 41 VALUE
\par                "----------------------------------------".
\par             02 LINE 23 COLUMN 5  VALUE "MENSAGEM : ".
\par             02 LINE 23 COLUMN 50 VALUE "RESPOSTA : ".
\par        01 TELA2.
\par             02 BLANK SCREEN.
\par       *
\par        PROCEDURE DIVISION
\par        010-00-INICIO.
\par             PERFORM 020-00-PROCESSA THRU
\par                     020-99-FIM-PROCESSA UNTIL
\par                     CODIGO = "NAO".
\par             MOVE "*** FIM DE PROGRAMA ***" TO MENS.
\par             DISPLAY (23, 16) MENS.
\par                     DISPLAY (01, 01) ERASE.
\par             STOP RUN.
\par       *
\par       /
\par        020-00-PROCESSA.
\par             DISPLAY TELA.
\par       * Comando READ do Pascal:
\par             ACCEPT (05, 56) ALTURA.
\par             ACCEPT (07, 56) BASE.
\par       * Comando que informa o computador para executar:
\par             COMPUTE HAREA = (ALTURA * BASE) /2.
\par       * Mostra a variavel HAREA na coordenada desejada.
\par             DISPLAY (09, 56) HAREA.
\par        020-01-REPETE.
\par             MOVE   "DESEJA CONTINUAR S/N..: " TO MENS.
\par             DISPLAY (23, 16) MENS.
\par             ACCEPT  (23, 60) RESPOSTA.
\par             IF RESPOSTA = "S" or "s"
\par                MOVE "SIM" TO CODIGO
\par             ELSE IF RESPOSTA = "N" or "n"
\par                MOVE "NAO" TO CODIGO
\par             ELSE IF RESPOSTA NOT EQUAL TO "S" or "s" or "N" or "n"
\par                MOVE "DIGITAR S/N OU s/n" TO MENS
\par                DISPLAY (23, 16) MENS
\par                ACCEPT  (23, 60) RESPOSTA
\par             GO TO 020-01-REPETE
\par                  ELSE NEXT SENTENCE.
\par        020-99-FIM-PROCESSA.
\par             EXIT.
\par       ***-------- FIM DO PROGRAMA PROG1 --------***
\par       * Tres primeiras colunas reservadas para o numero da pagina. 001
\par       * as tres colunas seguintes referem-se a secao. ex.001
\par       * ---------------------------------------------------
\par       * A coluna 7:
\par       * * (asterisco)       - Define o comentario.
\par       * / (barra contraria) - separa as paginas na impressao.
\par       * - (hifen)           - para dar continuidade.
\par       * ---------------------------------------------------
\par       * A coluna 8:
\par       * Todos os nomes de DIVISOES e SECOES;
\par       *
\par       * ---------------------------------------------------
\par       * A coluna 12:
\par       * ---------------------------------------------------
\par       * A coluna 72 eh o limite para escrever codigo.
\par       * ---------------------------------------------------
\par       * Da coluna 73 ateh a 80 e usada para documentar versoes.
\par       * ---------------------------------------------------
\par 
\par 
\par 
\par 
\par }
 