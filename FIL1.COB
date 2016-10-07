       IDENTIFICATION DIVISION.
       PROGRAM-ID. TULIS.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT MHS ASSIGN TO DISK
           ORGANIZATION IS LINE SEQUENTIAL
           FILE STATUS IS ERR.
       DATA DIVISION.
       FILE SECTION.
       FD MHS
           LABEL RECORD IS STANDARD
           VALUE OF FILE-ID IS 'DATA.TXT'
           DATA RECORD IS RECMHS.
       01 RECMHS.
           02 NAMA PIC X(25).
           02 NPM PIC X(8).

       WORKING-STORAGE SECTION.
       77 ERR PIC XX.
       01 ISI-LAGI PIC X.
           88 LAGI VALUE 'Y', 'y'.
           88 TIDAK VALUE 'T', 't'.

       SCREEN SECTION.
       01 HAPUS-LAYAR.
           02 BLANK SCREEN.
       01 ISI-DATA.
           02 LINE 3 COLUMN 5 'NAMA : ' HIGHLIGHT.
           02 COLUMN PLUS 1 PIC X(25) TO NAMA.
           02 LINE 4 COLUMN 5 'NPM : ' HIGHLIGHT.
           02 COLUMN PLUS 1 PIC X(8) TO NPM.
       PROCEDURE DIVISION.
       BUKA-FILE.
           OPEN OUTPUT MHS.
       MULAI.
           DISPLAY HAPUS-LAYAR
           DISPLAY ISI-DATA
           ACCEPT ISI-DATA.
           WRITE RECMHS
           DISPLAY(10, 5) 'ADA DATA LAGI [Y/T] ? '
           ACCEPT( , ) ISI-LAGI.
           IF LAGI GO TO MULAI.
       SELESAI.
           CLOSE MHS.
           STOP RUN.
