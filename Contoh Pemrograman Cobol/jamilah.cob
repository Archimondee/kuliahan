       IDENTIFICATION DIVISION.
       PROGRAM-ID. JAMILAH.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 ANGKA.
           02 INPUTAN PIC 99.
           02 HASIL PIC 99 VALUE 0.
           02 SISA PIC 99 VALUE 0.
           02 BIL PIC X(6).
       01 DATA-MAHASISWA.
           02 NAMA PIC X(30).
           02 KELAS PIC X(5).
           02 NPM PIC 999999999 VALUE 0.
       PROCEDURE DIVISION.
       BISMILLAH.
           DISPLAY 'PROGRAM BIODATA DAN REMAINDER'.
       INI-REMAINDER.
           DISPLAY 'MASUKAN ANGKA : ' ACCEPT INPUTAN.
           DISPLAY SPACE.
           DIVIDE 2 INTO INPUTAN GIVING HASIL REMAINDER SISA.
           IF SISA = 0
               MOVE 'GENAP' TO BIL
           ELSE
               MOVE 'GANJIL' TO BIL
           DISPLAY INPUTAN,' MERUPAKAN ANGKA ',BIL.
       BIODATA.
           DISPLAY 'NAMA :' ACCEPT NAMA.
           DISPLAY 'KELAS :', ACCEPT KELAS.
           DISPLAY 'NPM :', ACCEPT NPM.
           DISPLAY SPACE.
           DISPLAY SPACE.
           DISPLAY 'Nama anda adalah ', NAMA.
           DISPLAY 'Kelas anda adalah ',KELAS.
           DISPLAY 'NPM anda adalah ',NPM.
           DISPLAY SPACE.
           DISPLAY INPUTAN,'MERUPAKAN ANGKA ',BIL.
       ALHAMDULILLAH.
           STOP RUN.
       END PROGRAM JAMILAH.
