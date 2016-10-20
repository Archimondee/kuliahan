       IDENTIFICATION DIVISION.
       PROGRAM-ID. LA2.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 MASUKAN.
           02 JUM PIC 9(3).
           02 PIL PIC 9.
           02 HASIL PIC Z(15).
       01 HITUNG-LAGI PIC X.
           88 LAGI VALUE 'Y', 'y'.
           88 TIDAK VALUE 'T', 't'.
       SCREEN SECTION.
       01 MENU.
           02 LINE 2 COLUMN 30 VALUE 'MENU PEMBELIAN KUCING'.
           02 LINE 4 COLUMN 30 VALUE '1. ANGGORA'.
           02 LINE 5 COLUMN 30 VALUE '2. SIRBERIA'.
           02 LINE 6 COLUMN 30 VALUE '3. EXIT'.
           02 LINE 7 COLUMN 30 VALUE '==========================='.
           02 LINE 8 COLUMN 30 VALUE 'PILIHAN : '.
           02 LINE 8 COLUMN 40 PIC 9 TO PIL.
       PROCEDURE DIVISION.
       MULAI.
           DISPLAY MENU.
           ACCEPT MENU.
           IF PIL=1
              PERFORM ANGG
              GO TO TANYA.
           IF PIL=2
              PERFORM SERB
              GO TO TANYA.
           IF PIL=3
               GO TO SELESAI
           ELSE
               GO TO MULAI.
       SELESAI.
           STOP RUN.

       ANGG.
           DISPLAY (10, 2) 'JUMLAH KUCING YANG INGIN DIBELI: '.
           ACCEPT ( , ) JUM.
           COMPUTE HASIL = JUM * 1000000.
           DISPLAY (12, 2) 'TOTAL PEMBELIAN: ', HASIL.

       SERB.
           DISPLAY (10, 2) 'JUMLAH KUCING YANG INGIN DIBELI: '.
           ACCEPT ( , ) JUM.
           COMPUTE HASIL = JUM * 700000.
           DISPLAY (12, 2) 'TOTAL PEMBELIAN: ', HASIL.

       TANYA.
           DISPLAY (14, 2) 'INPUT LAGI? [Y/T] '
           ACCEPT HITUNG-LAGI.
           IF LAGI GO TO MULAI
           IF TIDAK GO TO SELESAI.
           IF NOT LAGI AND NOT TIDAK
              DISPLAY (17, 2) 'Y/y ATAU T/t'
              GO TO TANYA.
