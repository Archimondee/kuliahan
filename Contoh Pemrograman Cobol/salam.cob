       IDENTIFICATION DIVISION.
       PROGRAM-ID. SALAM.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  P PIC 9.
       77  Q PIC 9.
       01 KUCING.
           02 KATAF PIC X(05).
       01 KAMPRET.
           02 KATA OCCURS 5 TIMES PIC X(01).
       SCREEN SECTION.
       01 HAPUS.
           02 BLANK SCREEN.
       PROCEDURE DIVISION.
       UTAMA.
           PERFORM MASUK.
           DISPLAY HAPUS.
           PERFORM KELUAR VARYING P
           FROM 1 BY 1 UNTIL P > 5.
           ACCEPT P.
           STOP RUN.
       MASUK.
           DISPLAY(, ) 'MASUKKAN KATA YANG INGIN DIBENTUK: '.
           ACCEPT KATAF.
           MOVE KATAF TO KAMPRET.
       KELUAR.
           PERFORM TAMPI VARYING Q
           FROM P BY 1 UNTIL Q > 5.
           DISPLAY SPACE.
       TAMPI.
           DISPLAY (, ) KATA(Q).