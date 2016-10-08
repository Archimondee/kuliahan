       IDENTIFICATION DIVISION.
       PROGRAM-ID. LUAS-PERMUKAAN.
       ENVIRONTMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  LUAS.
           02 P PIC 9(2).
           02 L PIC 9(2).
           02 T PIC 9(2).
           02 LUAS-KUBUS PIC ZZ.
       PROCEDURE DIVISION.
       MULAI.
           DISPLAY (9, 9) 'PANJANG: '.
           ACCEPT ( , ) P.
           DISPLAY (10, 9) 'LEBAR: '.
           ACCEPT ( , ) L.
           DISPLAY (11, 9) 'TINGGI: '.
           ACCEPT ( , ) T.
           COMPUTE LUAS-KUBUS = (2 * P * L) + (2* P * T) + (2 * L * T).
           DISPLAY (12, 9) 'LUAS PERMUKAAN KUBUS : ',LUAS-KUBUS.
       SELESAI.
           STOP RUN.