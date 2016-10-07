       IDENTIFICATION DIVISION.
       PROGRAM-ID.  GENERICO.
      *
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CLIENTES ASSIGN TO DISK.
       DATA DIVISION.
       FILE SECTION.
       COPY FDGENERI.
      *
       WORKING-STORAGE SECTION.
       01  VARIAVEIS-SISTEMA.
           02  DV1            PIC 9(01) VALUE ZEROS.
           02  DV2            PIC 9(01) VALUE ZEROS.
           02  DV3            PIC 9(01) VALUE ZEROS.
           02  RESPOSTA       PIC A.
           02  CODIGO         PIC X(03) VALUE "SIM".
       01  WS-DATA.
           02  WS-DIA         PIC 9(02) VALUE ZEROS.
           02  WS-MES         PIC 9(02) VALUE ZEROS.
           02  WS-ANO         PIC 9(04) VALUE ZEROS.
       SCREEN SECTION.
       01  ENTRAR-DATA.
           02  LINE 10 COLUMN 10  VALUE "Informe a data atual:".
           02  LINE 11 COLUMN 11  VALUE " Formato (DDMMYYYY)  ".
       01  TELA.
           02  LINE  6 COLUMN 07  VALUE "Conta Corrente ........:".
           02  LINE  7 COLUMN 07  VALUE "Tipo de Conta..........:".
           02  LINE  9 COLUMN 07  VALUE "Nome ..................:".
           02  LINE 10 COLUMN 07  VALUE "Data de Nascimento ....:".
           02  LINE 11 COLUMN 07  VALUE "Sexo ..................:".
       PROCEDURE DIVISION.
      *----------------------------------------------------
       001-INICIO.
           DISPLAY (01, 01) ERASE.
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
           DISPLAY (23, 14) "                                         ".
      *----------------------------------------------------
       003-ABRE-ARQUIVO.
           OPEN OUTPUT CLIENTES.
      *----------------------------------------------------
       010-INICIALIZA-SISTEMA.
           DISPLAY (01, 01) ERASE.
           DISPLAY (02, 69) WS-DIA "/" WS-MES "/" WS-ANO.
      *----------------------------------------------------
       020-TELA.
           DISPLAY TELA.
      *----------------------------------------------------
       030-RECEBE-CONTA.
           ACCEPT (06, 32) CONTACORRENTE WITH PROMPT.
           IF CONTACORRENTE = "     "
              GO 030-RECEBE-CONTA.
      *----------------------------------------------------
       040-CALCULA-DV.
           COMPUTE DV1 = ( X1 * 6 ) + ( X2 * 5 ) + ( X3 * 4 ) +
                         ( X4 * 3 ) + ( X5 * 2 ).
           DIVIDE DV1 BY 11 GIVING DV2 REMAINDER DV3.
           IF DV3 = 0 OR DV3 = 1
              MOVE 0 TO DIGITOCONTROL
           ELSE
              COMPUTE DIGITOCONTROL = 11 - DV3.
           DISPLAY (06, 37) "-" DIGITOCONTROL.
      *----------------------------------------------------
       050-SETAR-TIPO-REGISTRO.
           MOVE 1 TO TIPOREGISTRO.
      *----------------------------------------------------
       060-TIPO-DE-CONTA.
           ACCEPT (07, 32) TIPOCONTA WITH PROMPT.
           IF TIPOCONTA = "E" or "e" or "C" or "c"
              NEXT SENTENCE
           ELSE
              DISPLAY (23, 14) "Digitar (E/C) "
              GO 060-TIPO-DE-CONTA.
           DISPLAY (23, 14) "              ".
      *----------------------------------------------------
       070-RECEBE-NOME.
           ACCEPT (09, 32) NOMECLIENTE WITH PROMPT.        
      *----------------------------------------------------
       080-RECEBE-DATANASC.
           ACCEPT (10, 32) DATANASCIMENT WITH PROMPT.
           IF DATANASCIMENT = ZEROS OR DATANASCIMENT = SPACES OR 
              DATANASCIMENT = 0 OR DATANASCIMENT = 00 OR 
              DATANASCIMENT = 000 OR DATANASCIMENT = 0000 OR
              DATANASCIMENT = 00000 OR DATANASCIMENT = 000000 OR
              DATANASCIMENT = 0000000 OR DATANASCIMENT = 00000000 OR
              DATANASCIMENT = 000000000 OR DATANASCIMENT = 0000000000
              DISPLAY (23, 14) "DATA INVALIDA! Reinforme"
              GO 080-RECEBE-DATANASC.
      ***** TESTA MES
           IF MES < 0 OR MES > 12
              DISPLAY (23, 14) "ANO POSSUI ENTRE 1 E 12 MESES!
      -                        " Reinforme."
              GO 080-RECEBE-DATANASC.
      ***** TESTA DIAS E MESES
           IF MES = 2
              IF DIA < 0 OR DIA > 29
                 DISPLAY (23, 14) "MES POSSUI ENTRE 1 E 29 DIAS.
      -                          " Reinforme."
              GO 080-RECEBE-DATANASC.
           IF MES = 1 OR MES = 3 OR MES = 5 OR MES = 7 OR
              MES = 8 OR MES = 10 OR MES = 12     
                 IF DIA < 0 OR DIA > 31
                 DISPLAY (23, 14) "MES POSSUI ENTRE 1 E 31 DIAS.
      -                           " Reinforme."
              GO 080-RECEBE-DATANASC.
           IF MES = 4 OR MES = 6 OR MES = 9 OR MES = 11
              IF DIA < 0 OR DIA > 30
              DISPLAY (23, 14) "MES POSSUI ENTRE 1 E 30 DIAS.
   -                           " Reinforme."
              GO 080-RECEBE-DATANASC.
           DISPLAY (23, 14) "                                         ".
      *----------------------------------------------------
       090-RECEBE-SEXO.
           ACCEPT (11, 32) SEXOCLIENTE WITH PROMPT.
           IF SEXOCLIENTE = "M" or "m" or "F" or "f"
              NEXT SENTENCE
           ELSE
              DISPLAY (23, 14) "Digitar (M/F) "
              GO 090-RECEBE-SEXO.
           DISPLAY (23, 14) "              ".
      *----------------------------------------------------
       100-GRAVAR-REGISTRO-1.
           MOVE "N" TO PARENTESCO.
           WRITE REG-CLIENTE.
      *----------------------------------------------------
       110-TESTA-SEGUNDO-TITULAR.
           DISPLAY (23, 14) "Esta conta ‚ Conjunta? ".
           ACCEPT (23, 37) RESPOSTA.
           DISPLAY (23, 14) "                         ".
           IF RESPOSTA = "N" or "n"
              GO TO 997-SAIR-OU-NAO
           ELSE IF RESPOSTA = "S" or "s"
              NEXT SENTENCE
           ELSE IF RESPOSTA NOT EQUAL TO "S" or "s" or "N" or "n"
              DISPLAY (23, 14) "Digitar (S/N) "
              GO 110-TESTA-SEGUNDO-TITULAR.
           DISPLAY (23, 14) "               ".
           MOVE "S" TO PARENTESCO.
      *----------------------------------------------------
       115-PREPARAR-TELA.
           DISPLAY (09, 32) "                                        ".
           DISPLAY (10, 32) "      ".
           DISPLAY (11, 32) " ".
      *----------------------------------------------------
       120-SETAR-TIPO-REGISTRO.
           MOVE 2 TO TIPOREGISTRO.
      *----------------------------------------------------
       130-RECEBE-NOME.
           ACCEPT (09, 32) NOMECLIENTE WITH PROMPT.
      *----------------------------------------------------
       140-RECEBE-DATANASC.
           ACCEPT (10, 32) DATANASCIMENT WITH PROMPT.
           IF DATANASCIMENT = ZEROS OR DATANASCIMENT = SPACES OR 
              DATANASCIMENT = 0 OR DATANASCIMENT = 00 OR 
              DATANASCIMENT = 000 OR DATANASCIMENT = 0000 OR
              DATANASCIMENT = 00000 OR DATANASCIMENT = 000000 OR
              DATANASCIMENT = 0000000 OR DATANASCIMENT = 00000000 OR
              DATANASCIMENT = 000000000 OR DATANASCIMENT = 0000000000
              DISPLAY (23, 14) "DATA INVALIDA! Reinforme"
              GO 140-RECEBE-DATANASC.
      ***** TESTA MES
           IF MES < 0 OR MES > 12
              DISPLAY (23, 14) "ANO POSSUI ENTRE 1 E 12 MESES!
      -                        " Reinforme."
              GO 140-RECEBE-DATANASC.
      ***** TESTA DIAS E MESES
           IF MES = 2
              IF DIA < 0 OR DIA > 29
                 DISPLAY (23, 14) "MES POSSUI ENTRE 1 E 29 DIAS.
      -                          " Reinforme."
              GO 140-RECEBE-DATANASC.
           IF MES = 1 OR MES = 3 OR MES = 5 OR MES = 7 OR
              MES = 8 OR MES = 10 OR MES = 12     
                 IF DIA < 0 OR DIA > 31
                 DISPLAY (23, 14) "MES POSSUI ENTRE 1 E 31 DIAS.
      -                           " Reinforme."
              GO 140-RECEBE-DATANASC.
           IF MES = 4 OR MES = 6 OR MES = 9 OR MES = 11
              IF DIA < 0 OR DIA > 30
              DISPLAY (23, 14) "MES POSSUI ENTRE 1 E 30 DIAS.
      -                           " Reinforme."
              GO 140-RECEBE-DATANASC.
           DISPLAY (23, 14) "                                         ".
      *----------------------------------------------------
       150-RECEBE-SEXO.
           ACCEPT (11, 32) SEXOCLIENTE WITH PROMPT.
           IF SEXOCLIENTE = "M" or "m" or "F" or "f"
              NEXT SENTENCE
           ELSE
              DISPLAY (23, 14) "Digitar (M/F) "
              GO 150-RECEBE-SEXO.
           DISPLAY (23, 14) "              ".
      *----------------------------------------------------
       160-GRAVAR-REGISTRO-2.
           WRITE REG-CLIENTE.
      *----------------------------------------------------
       996-LIMPAR.
           DISPLAY (06, 32) "       ".
           DISPLAY (07, 32) " ".
           DISPLAY (09, 32) "                                        ".
           DISPLAY (10, 32) "      ".
           DISPLAY (11, 32) " ".
           DISPLAY (23, 14) "                                        ".
      *----------------------------------------------------
       997-SAIR-OU-NAO.
           DISPLAY (23, 14) "Deseja cadastrar outro cliente? (S/N) ".
           ACCEPT  (23, 52) RESPOSTA.
           DISPLAY (23, 14) "                                        ".
           IF RESPOSTA = "N" or "n"
              MOVE "NAO" TO CODIGO
              GO TO 999-FIM
           ELSE IF RESPOSTA = "S" or "s"
              NEXT SENTENCE
           ELSE IF RESPOSTA NOT EQUAL TO "S" or "s" or "N" or "n"
              DISPLAY (23, 14) "Digitar (S/N) "
              GO 997-SAIR-OU-NAO.
           DISPLAY (23, 14) "              ".
      *----------------------------------------------------
       998-PREPARAR-TELA.
           DISPLAY (06, 32) "       ".
           DISPLAY (07, 32) " ".
           DISPLAY (09, 32) "                                        ".
           DISPLAY (10, 32) "      ".
           DISPLAY (11, 32) " ".
           DISPLAY (23, 14) "                                        ".
           GO TO 010-INICIALIZA-SISTEMA.
      *----------------------------------------------------
       999-FIM.
           CLOSE CLIENTES.
           DISPLAY (1, 1) ERASE.
           STOP RUN.
      ***---------- FIM DO PROGRAMA GENERICO ---------***
