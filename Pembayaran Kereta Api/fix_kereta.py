from conDb import configDb
from mysql.connector import MySQLConnection, Error
import string
import random
import re
import time
import datetime

def menu_utama():
    print '############################################'
    print '########## Menu Kereta #####################'
    print '         1. Input stok kereta '
    print '         2. Pembayaran tiket Kereta '
    print '         3. Daftar penumpang '
    print '         4. Log pembayaran'
    print '############################################'
    pil = input('Masukan pilihan : ')
    if pil == 1:
        inputKereta()
    elif pil == 2:
        menu_kereta()
    elif pil == 3:
        daftarPenumpang()
    elif pil == 4:
        pemilihan()

def inputKereta():
    try:
        varNama = "FALSE"
        varSymbol = "FALSE"
        kode_tiket = randomTiket()
        while varNama == "FALSE" or varSymbol == "FALSE":
            nama = raw_input("Masukan nama kereta : ")
            if len(nama) <= 20:
                varNama = "TRUE"
            else:
                varNama = "FALSE"
                print "Nama kereta tidak boleh lebih dari 20 huruf"
            if all(x.isalpha() or x.isspace() for x in nama):
                varSymbol = "TRUE"
            else:
                print("Harus menggunakan karakter alphabetic")
                varSymbol = "FALSE"

        dbConfig = configDb()
        connect = MySQLConnection(**dbConfig)
        query = connect.cursor()
        query.execute("SELECT * FROM stok_tiket")
        rows = query.fetchall()
        kode_t = []
        nama_k = []
        a = 0
        b = 0
        stop = "True"
        terdaftar = "True"

        for row in rows:
            kode_t.insert(a,row[1])
            nama_k.insert(a,row[2])
            a+=1

        while stop == "True" and b < len(nama_k):
            if nama_k[b] == nama:
                terdaftar = "True"
                stop = "False"
            else:
                terdaftar = "False"
                stop = "True"
            b+=1

        if terdaftar == "True":
            print "Kereta sudah terdaftar"
            inputKereta()
        else:
            print "Kereta belum terdaftar"
            tambahKereta(kode_tiket,nama)
    except Error as e:
        print (e)

def tambahKereta(kode_tiket,nama):
    a = time.localtime()
    today = []
    i = 1
    b = 0
    for i in a:
        today.insert(b,i)
        b+=1
    tanggal = "%s-%s-%s"%(today[0],today[1],today[2])

    varStok = "False"
    var_stok = "False"
    while varStok == "False" or var_stok == "False":
        stok = raw_input("Masukan stok tiket : ")
        if re.match('^[0-9]*$',stok):
            a = int(stok)
            if a>350:
                print "Batas maximal tiket kereta adalah 350 tiket"
                var_stok = "False"
            else:
                var_stok = "True"
            varStok = "True"
        else:
            print "Harus menggunakan karakter numeric"
            varStok = "False"

    varHarga = "False"
    var_harga = "False"
    while varHarga == "False" or var_harga == "False":
        harga = raw_input("Masukan harga tiket : ")
        if re.match('^[0-9]*$',harga):
            b = int(harga)
            if b > 500000:
                print "Batas maximal harga tiket adalah Rp 500.000"
                var_harga = "False"
            else:
                var_harga = "True"
            varHarga = "True"
        else:
            print "Harus menggunakan karakter numeric"
            varHarga = "False"
    queryStok = "INSERT INTO stok_tiket (kode_kereta,nama_kereta,stock_tiket,harga_tiket,log)"\
                "VALUES(%s,%s,%s,%s,%s)"
    argsStok = (kode_tiket,nama,stok,harga,tanggal)
    try:
        dbConfig = configDb()
        conn = MySQLConnection(**dbConfig)
        cursor = conn.cursor()
        cursor.execute(queryStok,argsStok)
        if cursor.lastrowid:
            print ("Sukses mendaftar")
        else:
            print "Gagal mendaftar"
        conn.commit()
        inputan(nama)
    except Error as e:
        print (e)
        
def inputan(nama):
    namaUser = "Admin"
    ktp = "Admin"
    kode_tiket = "Admin"
    kereta = nama
    gerbong = "A"
    kursi = "1"
    status = "Admin"

    query = "INSERT INTO daftar_pembeli (nama,ktp,kode_tiket,nama_kereta,gerbong,kursi,status)"\
            "VALUES(%s,%s,%s,%s,%s,%s,%s)"
    args = (namaUser,ktp,kode_tiket,kereta,gerbong,kursi,status)
    try:
        dbConfig = configDb()
        conn = MySQLConnection(**dbConfig)
        cursor = conn.cursor()
        cursor.execute(query,args)
        conn.commit()
    except Error as e:
        print(e) 
def randomTiket(size=6, chars=string.ascii_uppercase+string.digits):
    return ''.join(random.choice(chars) for _ in range(size))

#Belum benar#
def backMenu():
    pil = raw_input("Ingin kembali ke menu utama (ya/tidak): ")
    if pil == "Ya" or "YA" or "ya" or "y":
        menu_utama()
    else:
        print "Terimakasih telah menggunakan program kami"
        
def menu_kereta():
    try:
        dbConfig = configDb()
        conn = MySQLConnection(**dbConfig)
        query = conn.cursor()
        query.execute("SELECT * FROM stok_tiket")
        rows = query.fetchall()

        cekKereta = []
        cekStok = []
        itKereta = 0

        z = 0
        x = 0
        y = 0
        stop = "True"

        for row in rows:
            cekKereta.insert(z,row[2])
            cekStok.insert(z,row[3])
            z += 1
        print "No       Stock                Nama Kereta"
        while x <len(cekKereta) and x < len(cekStok):
            print x+1,"      ",cekStok[x],"                ",cekKereta[x]
            x+=1
        cariKereta = "False"
        varStoki = "False"
        varBatas = "False"
        while cariKereta == "False":
            pilih = raw_input("Pilih kereta : ")
            if re.match('^[0-9]*$',pilih):
                keretaan = int(pilih)
                if keretaan > len(cekStok):
                    print "Tidak ada nomor berikut"
                    cariKereta = "False"
                else:
                    namaKereta = cekKereta[keretaan-1]
                    tiket = cekStok[keretaan-1]
                    print "Anda memilih ",namaKereta
                    cariKereta = "True"
                    while varStoki == "False" and varBatas == "False":
                        stockie = raw_input("Masukan jumlah tiket : ")
                        if re.match('^[0-9]*$',stockie):
                            stokk = int(stockie)
                            if stokk > 2:
                                print "Batas pembelian tiket kereta adalah 2"
                                varBatas = "False"
                            else:
                                varBatas = "True"
                                stok_baru = tiket - stokk
                                if stok_baru<0:
                                    print "Tiket out of stock"
                                    menu_kereta()
                                else:
                                    query_tiket = "UPDATE stok_tiket SET stock_tiket = %s WHERE nama_kereta = %s"
                                    data_tiket = (stok_baru, namaKereta)
                                    try:
                                        dbConfig = configDb()
                                        conn_tiket = MySQLConnection(**dbConfig)
                                        cursor_tiket = conn_tiket.cursor()
                                        cursor_tiket.execute(query_tiket,data_tiket)
                                        conn_tiket.commit()
                                        pembelian(stokk,namaKereta)
                                    except Error as e:
                                        print (e)
                        else:
                            print "Harus menggunakan numeric"
                            varStoki = "False"      
            else:
                print "Harus menggunakan numeric"
                cariKereta = "False"
    except Error as e:
        print (e)
            
def pembelian(stokk,namaKereta):
    for i in range(stokk):
        print "###################### PEMBELIAN TIKET #######################"
        varNama = "False"
        varKtp = "False"
        varJumlah = "False"
        while varNama == "False":
            namaPembeli = raw_input("Nama : ")
            if all(x.isalpha() or x.isspace() for x in namaPembeli):
                varNama = "True"
            else:
                print("Harus menggunakan karakter alphabetic")
                varNama = "False"
        while varKtp == "False" or varJumlah == "False":
            ktp = raw_input("No KTP : ")
            if re.match('^[0-9]*$',ktp):
                varKtp = "True"
                if len(ktp) == 10:
                    varJumlah = "True"
                else:
                    varJumlah = "False"
                    print "KTP harus menggunakan 10 karakter numeric"
            else:
                print "Harus menggunakan karakter numeric"
                varKtp = "False"
        kode_tiket = randomTiket()
        cekGerbong(namaKereta,stokk,namaPembeli,ktp,kode_tiket)
    backMenu()
def cekGerbong (namaKereta,stokk,namaPembeli,ktp,kode_tiket):
    try:
        dbConfig = configDb()
        conn_cek = MySQLConnection(**dbConfig)
        cursor_cek = conn_cek.cursor()
        query = "SELECT * FROM daftar_pembeli WHERE nama_kereta = '%s'"%(namaKereta)
        cursor_cek.execute(query)
        rows = cursor_cek.fetchall()
        cek_kursi = []
        cek_kereta = []
        cek = 0
        g = 0
        stop = "True"
        for row in rows:
            cek_kereta.insert(cek,row[4])
            cek_kursi.insert(cek,row[6])
            cek+=1
        if not cek_kursi:
            cek_kursi.insert(0,"A")
        else:
            g = len(cek_kursi)
            if len(cek_kursi) > 0 and len(cek_kursi) <= 30:
                cek_kursi.insert(g,"A")
            elif len(cek_kursi) >= 31 and len(cek_kursi) <= 60:
                cek_kursi.insert(g,"B")
            elif len(cek_kursi) >= 61 and len(cek_kursi) <= 90:
                cek_kursi.insert(g,"C")
            elif len(cek_kursi) >= 91 and len(cek_kursi) <= 120:
                cek_kursi.insert(g,"D")
            elif len(cek_kursi) >= 151 and len(cek_kursi) <= 180:
                cek_kursi.insert(g,"E")
            elif len(cek_kursi) >= 181 and len(cek_kursi) <= 210:
                cek_kursi.insert(g,"F")
            elif len(cek_kursi) >= 211 and len(cek_kursi) <= 240:
                cek_kursi.insert(g,"G")
            elif len(cek_kursi) >= 241 and len(cek_kursi) <= 270:
                cek_kursi.insert(g,"H")
            elif len(cek_kursi) >= 271 and len(cek_kursi) <= 300:
                cek_kursi.insert(g,"I")
            elif len(cek_kursi) >= 301 and len(cek_kursi) <= 330:
                cek_kursi.insert(g,"J")
            elif len(cek_kursi) >= 331 and len(cek_kursi) <= 350:
                cek_kursi.insert(g,"K")
            else:
                print "Out of number"
        de = g+1
        ee = cek_kursi[g]
        print "No Kursi : ",de
        print "Gerbong : ",ee
        status = "Lunas"
        print status
        a = time.localtime()
        today = []
        i = 1
        b = 0
        for i in a:
            today.insert(b,i)
            b+=1
            
        tanggal = datetime.date(today[0],today[1],today[2])
        try:
            dbConfig = configDb()
            connection = MySQLConnection(**dbConfig)
            cursor = connection.cursor()
            query = "INSERT INTO daftar_pembeli(nama,ktp,kode_tiket,nama_kereta,gerbong,kursi,status,log)"\
                    "VALUES(%s,%s,%s,%s,%s,%s,%s,%s)"
            args = (namaPembeli,ktp,kode_tiket,namaKereta,ee,de,status,tanggal)
            cursor.execute(query,args)
            
            if cursor.lastrowid:
                print "Pembelian berhasil"
            else:
                print "Pembelian gagal"
            connection.commit()
        except Error as e:
            print (e)
    except Error as e:
        print (e)

def daftarPenumpang():
    try:
        dbConfig = configDb()
        conn = MySQLConnection(**dbConfig)
        query = conn.cursor()
        query.execute("SELECT * from stok_tiket")
        rows = query.fetchall()
        dafKereta = []
        a = 0
        b = 0
        stop = "True"

        for row in rows:
            dafKereta.insert(a,row[2])
            a += 1
        print "Pilih Kereta untuk melihat daftar penumpang"
        while b < len(dafKereta):
            print b+1," ",dafKereta[b]
            b+=1
        pilihKereta = input("Pilih Kereta : ")
        if pilihKereta > len(dafKereta):
            print "Error"
            daftarPenumpang()
            print ""
        else:
            namakereta = dafKereta[pilihKereta-1]
            try:
                dbConfig = configDb()
                conni = MySQLConnection(**dbConfig)
                cursori = conni.cursor()
                query = "SELECT * FROM daftar_pembeli"
                cursori.execute(query)
                rows = cursori.fetchall()
                c = 0
                d = 0
                e = 0
                f = 0
                dafKereta = []
                dafNama = []
                dafKtp = []
                dafGerbong = []
                dafKursi = []
                
                fixKereta = []
                fixNama = []
                fixKtp = []
                fixGerbong = []
                fixKursi = []
                for row in rows:
                    dafKereta.insert(c,row[4])
                    dafNama.insert(c,row[1])
                    dafKtp.insert(c,row[2])
                    dafGerbong.insert(c,row[5])
                    dafKursi.insert(c,row[6])
                    c+=1
                if len(dafKereta) == 0:
                    print "Kereta ini belum ada penumpangnya"
                else:
                    while d < len (dafKereta):
                        if dafKereta[d] == namakereta:
                            fixKereta.insert(d,dafKereta[d])
                            fixNama.insert(d,dafNama[d])
                            fixKtp.insert(d,dafKtp[d])
                            fixGerbong.insert(d,dafGerbong[d])
                            fixKursi.insert(d,dafKursi[d])
                        d+=1

                    print ""
                    print ""
                    print "Daftar Penumpang ",namakereta
                    print ""
                    print "No  No.KTP       No.Duduk            Nama Penumpang"
                    while e < len(fixKereta):
                        print e+1," ","%s   %s                  %s"%(fixKtp[e],fixGerbong[e]+fixKursi[e],fixNama[e])
                        e+=1
            except Error as e:
                print (e)
    except Error as e:
        print (e)

def backPenumpang():
    bp = "False"
    print ""
    print ""
    print "# MENU #"
    print "1. Kembali ke menu daftar penumpang ? "
    print "2. Kembali ke menu utama ? "
    print "3. Exit"
    while bl == "False":
        pilihLog = raw_input("Silahkan pilih menu diatas : ")
        if re.match('^[0-9]*$',pilihLog):
            bl = "True"
            if pilihLog == 1:
                daftarPenumpang()
            elif pilihLog == 2:
                menu_utama()
            elif pilihLog == 3:
                print "Terimakasih "
            else:
                print "Pilihan yang anda maksud tidak tersedia"
                backLog()
        else:
            print "Harus menggunakan karakter numeric"
            bl = "False"
                
    
            
def keuntunganPerhari():
    a = time.localtime()
    today = []
    i = 1
    z = 0
    for i in a:
        today.insert(z,i)
        z+=1
    try:
        dbConfig = configDb()
        conn = MySQLConnection(**dbConfig)
        cursor = conn.cursor()
        hire_end = datetime.date(today[0],today[1],today[2])
        query = ("SELECT nama,ktp,kode_tiket,nama_kereta,gerbong,kursi FROM daftar_pembeli WHERE log = '%s'")%(hire_end)
        cursor.execute(query)
        rows = cursor.fetchall()
        no = 0
        print "No  No.KTP       KodeTiket    Nama Kereta        No.Bangku    Nama Penumpang"
        for (nama,ktp,kode_tiket,nama_kereta,gerbong,kursi)in rows:  
            print no+1," ",ktp," ",kode_tiket,"     ",nama_kereta,"     ",gerbong+kursi,"      ",nama
            no+=1
        print ""
        print "Tiket yang terjual per",hire_end," sebanyak ",len(rows),"tiket"
        print ""
        backLog()

    except Error as e:
        print (e)
def keuntunganPerminggu():
    a = time.localtime()
    today = []
    i = 1
    z = 0
    b = 1
    c = 0
    for i in a:
        today.insert(z,i)
        z+=1
    minggu = today[2] - 7
    bulan = today[1]
    if minggu < 0:
        hasil = 30 + minggu
        bulan -= 1
    try:
        dbConfig = configDb()
        conn = MySQLConnection(**dbConfig)
        cursor = conn.cursor()
        query = ("SELECT nama,ktp,kode_tiket,nama_kereta,gerbong,kursi,status FROM daftar_pembeli WHERE log between %s and %s")
        hire_end = datetime.date(today[0],today[1],today[2])
        hire_start = datetime.date(today[0],bulan,hasil)
        cursor.execute(query,(hire_start,hire_end))
        rows = cursor.fetchall()
        no = 0
        print "No  No.KTP       KodeTiket    Nama Kereta        No.Bangku    Nama Penumpang"
        for (nama,ktp,kode_tiket,nama_kereta,gerbong,kursi,status)in rows:  
            print no+1," ",ktp," ",kode_tiket,"     ",nama_kereta,"     ",gerbong+kursi,"      ",nama
            no+=1
        print ""
        print "Tiket yang terjual per",hire_start," hingga ",hire_end," sebanyak ",len(rows),"tiket"
        print ""
        backLog()

    except Error as e:
        print (e)

def keuntunganPerbulan():
    a = time.localtime()
    today = []
    i = 1
    z = 0
    b = 1
    c = 0
    for i in a:
        today.insert(z,i)
        z+=1
    minggu = today[2] - 30
    bulan = today[1]
    if minggu < 0:
        hasil = 30 + minggu
        bulan -= 1
    try:
        dbConfig = configDb()
        conn = MySQLConnection(**dbConfig)
        cursor = conn.cursor()
        query = ("SELECT nama,ktp,kode_tiket,nama_kereta,gerbong,kursi,status FROM daftar_pembeli WHERE log between %s and %s")
        hire_end = datetime.date(today[0],today[1],today[2])
        hire_start = datetime.date(today[0],bulan,hasil)
        cursor.execute(query,(hire_start,hire_end))
        rows = cursor.fetchall()
        no = 0
        print "No  No.KTP       KodeTiket    Nama Kereta        No.Bangku    Nama Penumpang"
        for (nama,ktp,kode_tiket,nama_kereta,gerbong,kursi,status)in rows:  
            print no+1," ",ktp," ",kode_tiket,"     ",nama_kereta,"     ",gerbong+kursi,"      ",nama
            no+=1
        print ""
        print "Tiket yang terjual per",hire_start," hingga ",hire_end," sebanyak ",len(rows),"tiket"
        print ""
        backLog()
    except Error as e:
        print (e)    
def pemilihan():
    print "Untuk melihat jumlah tiket yang terjual dapat di pilih dengan menu ini"
    print "1. Perhari"
    print "2. Perminggu"
    print "3. Perbulan"
    pilihAja = input("Silahkan pilih pada menu diatas : ")
    if pilihAja == 1:
        keuntunganPerhari()
    elif pilihAja == 2:
        keuntunganPerbulan()
    elif pilihAja == 3:
        keuntunganPerbulan()
    else:
        print "Kesalahan pemilihan kembali ke menu awal"
        pemilihan()

def backLog():
    bl = "False"
    print ""
    print ""
    print "# MENU #"
    print "1. Kembali ke menu log pembayaran ? "
    print "2. Kembali ke menu utama ? "
    print "3. Exit"
    while bl == "False":
        pilihLog = raw_input("Silahkan pilih menu diatas : ")
        if re.match('^[0-9]*$',pilihLog):
            bl = "True"
            int(pilihLog)
            if pilihLog == "1":
                pemilihan()
            elif pilihLog == "2":
                menu_utama()
            elif pilihLog == "3":
                print "Terimakasih "
            else:
                print "Pilihan yang anda maksud tidak tersedia"
                backLog()
        else:
            print "Harus menggunakan karakter numeric"
            bl = "False"        
menu_utama()

