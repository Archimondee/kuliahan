       IDENTIFICATION DIVISION.
       PROGRAM-ID. MenuMakanan.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Masukan.
           02 PIL PIC 9.
           02 JUM PIC 9(3).
           02 TOTAL PIC 9(8).
       01 HITUNG-LAGI PIC X.
           88 LAGI VALUE 'Y', 'y'.
           88 TIDAK VALUE 'T', 't'.
       
       SCREEN SECTION.
       01 HAPUS-LAYAR.
           02 BLANK SCREEN.
           
       01 MENU.
           02 LINE 2 COLUMN 20 VALUE 'MENU MAKANAN'.
           02 LINE 4 COLUMN 20 VALUE '1. MIE AYAM YAMIN   Rp12.000,00'.
           02 LINE 5 COLUMN 20 VALUE '2. MIE AYAM BAKSO   Rp14.000,00'.
           02 LINE 6 COLUMN 20 VALUE '3. MIE AYAM SPESIAL Rp18.000,00'.
           02 LINE 7 COLUMN 20 VALUE '4. MIE AYAM BIASA   Rp10.000,00'.
           02 LINE 8 COLUMN 20 VALUE '5. MIE AYAM PANGSIT Rp11.500,00'.
           02 LINE 9 COLUMN 20 VALUE '===================='.
           02 LINE 11 COLUMN 20 VALUE 'PILIH MAKANAN [ ]'.
           02 LINE 11 COLUMN 36 PIC 9 TO PIL.
       
       01 PORSI.
           02 LINE 2 COLUMN 30 VALUE 'BERAPA PORSI YANG ANDA PESAN?[ ]'.
           02 LINE 2 COLUMN 30 PIC 9(3) TO JUM.
           
       PROCEDURE DIVISION.    
       MULAI.
           DISPLAY HAPUS-LAYAR.
           DISPLAY MENU.
           ACCEPT MENU.
           IF PIL = 1
               PERFORM YAMIN
               GO TO TANYA.
           IF PIL = 2
               PERFORM BAKSO
               GO TO TANYA.
           IF PIL = 3
               PERFORM SPESIAL
               GO TO TANYA.
           IF PIL = 4
               PERFORM BIASA
               GO TO TANYA.
           IF PIL = 5
               PERFORM PANGSIT
               GO TO TANYA.
           ELSE GO TO TANYA.

       SELESAI.
           STOP RUN.
           
       YAMIN.
           DISPLAY HAPUS-LAYAR.
           DISPLAY PORSI.
           COMPUTE TOTAL = (JUM * 12000).
           DISPLAY (5, 2) 'TOTAL PEMBAYARAN: ',TOTAL.
           
       BAKSO.
           DISPLAY HAPUS-LAYAR.
           DISPLAY PORSI.
           COMPUTE TOTAL = (JUM * 14000).
           DISPLAY (5, 2) 'TOTAL PEMBAYARAN: ',TOTAL.
       
       SPESIAL.
           DISPLAY HAPUS-LAYAR.
           DISPLAY PORSI.
           COMPUTE TOTAL = (JUM * 18000).
           DISPLAY (5, 2) 'TOTAL PEMBAYARAN: ',TOTAL.
       
       BIASA.
           DISPLAY HAPUS-LAYAR.
           DISPLAY PORSI.
           COMPUTE TOTAL = (JUM * 10000).
           DISPLAY (5, 2) 'TOTAL PEMBAYARAN: ',TOTAL.
       
       PANGSIT.
           DISPLAY HAPUS-LAYAR.
           DISPLAY PORSI.
           COMPUTE TOTAL = (JUM * 11500).
           DISPLAY (5, 2) 'TOTAL PEMBAYARAN: ',TOTAL.
        
       TANYA.
           DISPLAY (7, 2) 'LAGI? [Y/T]'
           ACCEPT HITUNG-LAGI.
           IF LAGI GO TO MULAI.
           IF TIDAK GO TO SELESAI.
           IF NOT LAGI AND NOT TIDAK
               DISPLAY (9,2) 'Y/y ATAU T/t'
               GO TO TANYA.