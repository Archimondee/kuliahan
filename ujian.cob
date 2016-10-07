       IDENTIFICATION DIVISION.
       PROGRAM-ID. CONTOH.
       AUTHOR. SAYA.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 MASUKAN.
           02 NAMA PIC X(20).
           02 NPM PIC X(8).
           02 KELAS PIC X(5).
           02 TAHUN PIC 9(4).
           02 UMUR PIC 9(2).
           02 UTS PIC 9(3).
           02 UAS PIC 9(3).
           02 HASIL PIC Z99.
       SCREEN SECTION.
       01 HAPUS-LAYAR.
           02 BLANK SCREEN.
       PROCEDURE DIVISION.
       MASUKKAN-DATA.
           DISPLAY HAPUS-LAYAR.
           DISPLAY 'NAMA : '.
           ACCEPT NAMA.
           DISPLAY 'NPM :'.
           ACCEPT NPM.
           DISPLAY 'KELAS :'.
           ACCEPT KELAS.
           DISPLAY 'TAHUN LAHIR :'.
           ACCEPT TAHUN.
           DISPLAY 'UTS :'.
           ACCEPT UTS.
           DISPLAY 'UAS :'.
           ACCEPT UAS.
       HITUNG-DATA.
           COMPUTE UMUR = 2016 - TAHUN.
           COMPUTE HASIL = (UTS * 70 / 100) + (UAS * 30 / 100).
       TAMPIL-DATA.
           DISPLAY 'Nama :', NAMA.
           DISPLAY 'NPM :', NPM.
           DISPLAY 'Kelas :', KELAS.
           DISPLAY 'UMUR : ', UMUR.
           DISPLAY 'Rata-rata: ', HASIL.
       SELESAI.
           STOP RUN.
