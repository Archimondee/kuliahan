       FD CLIENTES
           LABEL RECORD IS STANDARD
           RECORD CONTAINS 56 CHARACTERS
           DATA RECORD IS REG-CLIENTE
           VALUE OF FILE-ID IS "CLIENTES.DAT".
       01  REG-CLIENTE.
           02  CONTACORRENTE.
               03  X1         PIC 9(01).
                   88 X1T     VALUE 0 THRU 9.
               03  X2         PIC 9(01).
                   88 X2T     VALUE 0 THRU 9.
               03  X3         PIC 9(01).
                   88 X3T     VALUE 0 THRU 9.
               03  X4         PIC 9(01).
                   88 X4T     VALUE 0 THRU 9.
               03  X5         PIC 9(01).
                   88 X5T     VALUE 0 THRU 9.
           02  DIGITOCONTROL  PIC 9(01).
               88 DIGCTRL     VALUE 0 THRU 9.
           02  TIPOREGISTRO   PIC 9(01).
               88  TIPOREG    VALUE 1 THRU 2.
           02  TIPOCONTA      PIC A(01).
               88  TIPOCON    VALUE "E" "C" "e" "c".
           02  NOMECLIENTE    PIC X(40).
           02  DATANASCIMENT.
               04  DIA        PIC 9(02).
                   88  DIA2   VALUE 1 THRU 31.
               04  MES        PIC 9(02).
                   88  MES2   VALUE 1 THRU 12.
               04  ANO        PIC 9(02).
           02  SEXOCLIENTE    PIC A(01).
               88  SEXOCLI     VALUE "F" "M" "f" "m".
           02  PARENTESCO     PIC A(01).
               88  PARENTE     VALUE "S" "s" "N" "n".
