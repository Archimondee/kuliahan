       IDENTIFICATION DIVISION.
       PROGRAM-ID.  TRABALHO.
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
       COPY LAYOUT.
      *
       WORKING-STORAGE SECTION.
       01  VARIAVEIS-SISTEMA.
           02  TESTAPARENTE   PIC A(01) VALUE SPACES.
           02  DV1            PIC 9(01) VALUE ZEROS.
           02  DV2            PIC 9(01) VALUE ZEROS.
           02  DV3            PIC 9(01) VALUE ZEROS.
           02  WS-LIMPA       PIC X(30) VALUE SPACES.
           02  RESPOSTA       PIC A.
           02  CODIGO         PIC X(03) VALUE "SIM".
           02  WS-PAUSA       PIC X(01).
           02  REGISTROS      PIC 9(03) VALUE ZEROS.
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
               "ษออออออออออหออออออออออออออออออออออออออออ".
           02  LINE 1  COLUMN 41 VALUE
               "ออออออออออออออออออออออออออหออออออออออออป".
           02  LINE 2  COLUMN 1  VALUE "บ".
           02  LINE 2  COLUMN 80 VALUE "บ".
           02  LINE 2  COLUMN 12 VALUE "บ".
           02  LINE 2  COLUMN 67 VALUE "บ".
           02  LINE 3  COLUMN 1  VALUE
               "ฬออออออออออสออออออออออออออออออออออออออออ".
           02  LINE 3  COLUMN 41 VALUE
               "ออออออออออออออออออออออออออสออออออออออออน".
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
               "อออออออออออออออออออออออออออออออหอออออออน".
           02  LINE 23 COLUMN 1  VALUE "บ MENSAGEM บ".
           02  LINE 23 COLUMN 80 VALUE "บ".
           02  LINE 23 COLUMN 72 VALUE "บ".
           02  LINE 23 COLUMN 74 VALUE "<   >".
           02  LINE 24 COLUMN 1  VALUE
               "ศออออออออออสออออออออออออออออออออออออออออ".
           02  LINE 24 COLUMN 41 VALUE
               "อออออออออออออออออออออออออออออออสอออออออผ".
           02  LINE 2  COLUMN 26 VALUE "*** CADASTRO DE CLIENTES ***".
       01  ENTRAR-DATA.
           02  LINE 10 COLUMN 10  VALUE "Informe a data atual:".
           02  LINE 11 COLUMN 11  VALUE " Formato (DDMMYYYY)  ".
       01  TELA.
           02  LINE  6 COLUMN 07  VALUE "Conta Corrente ........:".
           02  LINE  7 COLUMN 07  VALUE "Tipo de Conta..........:".
           02  LINE  7 COLUMN 50  VALUE "(E)special ou (C)omum".
           02  LINE  9 COLUMN 07  VALUE "Nome ..................:".
           02  LINE 10 COLUMN 07  VALUE "Data de Nascimento ....:".
           02  LINE 10 COLUMN 50  VALUE "Formato (DDMMYY)".
           02  LINE 11 COLUMN 07  VALUE "Sexo ..................:".
           02  LINE 11 COLUMN 50  VALUE "(M)asculino ou (F)eminino".
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
           DISPLAY JANELA.
           DISPLAY (02, 69) WS-DIA "/" WS-MES "/" WS-ANO.
      *----------------------------------------------------
       011-ATUALIZA-HORA-1.
           ACCEPT WS-HORA FROM TIME.
           DISPLAY (02, 03) WS-HOR ":" WS-MIN ":" WS-SEG.
      *----------------------------------------------------
       020-TELA.
           DISPLAY TELA.
      *----------------------------------------------------
       030-RECEBE-CONTA.
           ACCEPT (06, 32) CONTACORRENTE WITH PROMPT.
           IF CONTACORRENTE = SPACES
              GO 030-RECEBE-CONTA.
      *----------------------------------------------------
       031-ATUALIZA-HORA-2.
           ACCEPT WS-HORA FROM TIME.
           DISPLAY (02, 03) WS-HOR ":" WS-MIN ":" WS-SEG.
      *----------------------------------------------------
       040-CALCULA-DV.
           COMPUTE DV1 = ( X1 * 6 ) + ( X2 * 5 ) + ( X3 * 4 ) +
                         ( X4 * 3 ) + ( X5 * 2 ).
           DIVIDE DV1 BY 11 GIVING DV2 REMAINDER DV3.
           IF DV3 = 0 OR DV3 = 1
              MOVE DV3 TO DIGITOCONTROL
           ELSE
              COMPUTE DIGITOCONTROL = 11 - DV3.
           DISPLAY (06, 37) "-" DIGITOCONTROL.
      *----------------------------------------------------
       041-ATUALIZA-HORA-3.
           ACCEPT WS-HORA FROM TIME.
           DISPLAY (02, 03) WS-HOR ":" WS-MIN ":" WS-SEG.
      *----------------------------------------------------
       050-SETAR-TIPO-REGISTRO.
           MOVE 1 TO TIPOREGISTRO.
      *----------------------------------------------------
       051-ATUALIZA-HORA-4.
           ACCEPT WS-HORA FROM TIME.
           DISPLAY (02, 03) WS-HOR ":" WS-MIN ":" WS-SEG.
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
       061-ATUALIZA-HORA-5.
           ACCEPT WS-HORA FROM TIME.
           DISPLAY (02, 03) WS-HOR ":" WS-MIN ":" WS-SEG.
      *----------------------------------------------------
       070-RECEBE-NOME.
           ACCEPT (09, 32) NOMECLIENTE WITH PROMPT.        
      *----------------------------------------------------
       071-ATUALIZA-HORA-6.
           ACCEPT WS-HORA FROM TIME.
           DISPLAY (02, 03) WS-HOR ":" WS-MIN ":" WS-SEG.
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
       081-ATUALIZA-HORA-7.
           ACCEPT WS-HORA FROM TIME.
           DISPLAY (02, 03) WS-HOR ":" WS-MIN ":" WS-SEG.
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
       091-ATUALIZA-HORA-8.
           ACCEPT WS-HORA FROM TIME.
           DISPLAY (02, 03) WS-HOR ":" WS-MIN ":" WS-SEG.
      *----------------------------------------------------
       100-GRAVAR-REGISTRO-1.
           MOVE "N" TO PARENTESCO.
           WRITE REG-CLIENTE.
      *----------------------------------------------------
       101-ATUALIZA-HORA-9.
           ACCEPT WS-HORA FROM TIME.
           DISPLAY (02, 03) WS-HOR ":" WS-MIN ":" WS-SEG.
      *----------------------------------------------------
       110-TESTA-SEGUNDO-TITULAR.
           DISPLAY (23, 14) "Esta conta  Conjunta? ".
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
           MOVE RESPOSTA TO PARENTESCO.
      *----------------------------------------------------
       111-ATUALIZA-HORA-10.
           ACCEPT WS-HORA FROM TIME.
           DISPLAY (02, 03) WS-HOR ":" WS-MIN ":" WS-SEG.
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
       131-ATUALIZA-HORA-11.
           ACCEPT WS-HORA FROM TIME.
           DISPLAY (02, 03) WS-HOR ":" WS-MIN ":" WS-SEG.
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
       141-ATUALIZA-HORA-12.
           ACCEPT WS-HORA FROM TIME.
           DISPLAY (02, 03) WS-HOR ":" WS-MIN ":" WS-SEG.
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
       151-ATUALIZA-HORA-13.
           ACCEPT WS-HORA FROM TIME.
           DISPLAY (02, 03) WS-HOR ":" WS-MIN ":" WS-SEG.
      *----------------------------------------------------
       160-GRAVAR-REGISTRO-2.
           WRITE REG-CLIENTE.
      *----------------------------------------------------
       161-ATUALIZA-HORA-14.
           ACCEPT WS-HORA FROM TIME.
           DISPLAY (02, 03) WS-HOR ":" WS-MIN ":" WS-SEG.
      *----------------------------------------------------
       996-LIMPAR.
           COMPUTE REGISTROS = REGISTROS + 1.
           DISPLAY (23, 75) REGISTROS.
           DISPLAY (06, 32) "       ".
           DISPLAY (07, 32) " ".
           DISPLAY (09, 32) "                                        ".
           DISPLAY (10, 32) "      ".
           DISPLAY (11, 32) " ".
           DISPLAY (23, 14) "                                        ".
           ACCEPT WS-HORA FROM TIME.
           DISPLAY (02, 03) WS-HOR ":" WS-MIN ":" WS-SEG.
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
           ACCEPT WS-HORA FROM TIME.
           DISPLAY (02, 03) WS-HOR ":" WS-MIN ":" WS-SEG.
      *----------------------------------------------------
       998-PREPARAR-TELA.
           DISPLAY (06, 32) "       ".
           DISPLAY (07, 32) " ".
           DISPLAY (09, 32) "                                        ".
           DISPLAY (10, 32) "      ".
           DISPLAY (11, 32) " ".
           DISPLAY (23, 14) "                                        ".
           ACCEPT WS-HORA FROM TIME.
           DISPLAY (02, 03) WS-HOR ":" WS-MIN ":" WS-SEG.
           GO TO 010-INICIALIZA-SISTEMA.
      *----------------------------------------------------
       999-FIM.
           CLOSE CLIENTES.
           DISPLAY (1, 1) ERASE.
           DISPLAY TELA-FIM.
           STOP RUN.
      ***---------- FIM DO PROGRAMA EXERCICIO1 ---------***
