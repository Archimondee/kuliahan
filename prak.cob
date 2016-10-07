       IDENTIFICATION DIVISION.
       PROGRAM-ID. CONTOH.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 DATA-MASUKKAN.
           02 NAMA PIC A(10).
           02 GAJI.
               03 GAJI-POKOK PIC 9(6).
               03 TUNJANGAN PIC 9(6).
           02 TOTAL-GAJI PIC 9(7).
           02 TANYA PIC A.
               88 LAGI VALUE IS 'Y', 'y'.
               88 TIDAK VALUE IS 'T', 't'.
       SCREEN SECTION.
       01 HAPUS-LAYAR.
           49 BLANK SCREEN.
       PROCEDURE DIVISION.
       MULAI.
          HAPUS-LAYAR.
          DISPLAY (1,1) `NAMA ANDA         :`.
          ACCEPT NAMA.
          DISPLAY (2,1) 'GAJI POKOK        :RP.'.
          ACCEPT GAJI-POKOK.
          DISPLAY (3,1) 'BESARNYA TUNJANGAN:RP.'.
          ACCEPT TUNJANGAN.
          COMPUTE TOTAL-GAJI = GAJI-POKOK + TUNJANGAN.
          DISPLAY HAPUS-LAYAR.
          DISPLAY '>>>GAJI ANDA UNTU BULAN INI<<<'.
          DISPLAY ''.
          DISPLAY 'NAMA              :',NAMA.
          DISPLAY 'GAJI POKOK        : RP.',GAJI-POKOK.
          DISPLAY 'GAJI TUNJANGAN    : RP.',TUNJANGAN.
          DISPLAY 'TOTAL GAJI ANDA   : RP.',TOTAL-GAJI.
       SELESAI
          STOP RUN.





