       IDENTIFICATION DIVISION.
       PROGRAM-ID.
       ENVIRONTMENT DIVISION.
       DATA DIVISION.
           01 Alas PIC 99.
           01 Tinggi PIC 99.
           01  Luas PIC 99.
       PROCEDURE DIVISION.
       MULAI.
           DISPLAY 'MASUKKAN ALAS: '.
           ACCEPT Alas.
           DISPLAY 'MASUKKAN TINGGI: '.
           ACCEPT Tinggi.
           COMPUTE Luas = Alas*Tinggi/2.
           DISPLAY 'LUAS SEGITIGA: ',Luas.
       SELESAI.
           STOP RUN.