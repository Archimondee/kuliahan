       IDENTIFICATION DIVISION.
       PROGRAM-ID. GEN-GAN.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  ANGKA.
           02 A PIC 99.
           02 HASIL PIC 99.
           02 SISA PIC 99.
           02 BIL PIC X(6).
       PROCEDURE DIVISION.
       MULAI.
           DISPLAY (1, 1) 'MASUKKAN ANGKA: '.
           ACCEPT A.
           DISPLAY SPACE.
           DIVIDE 2 INTO A GIVING HASIL REMAINDER SISA.
           IF SISA = 0
           MOVE 'GENAP' TO BIL
           ELSE
           MOVE 'GANJIL' TO BIL.
           DISPLAY A,' MERUPAKAN ANGKA ',BIL.
       SELESAI.
           STOP RUN.
