from iniConfig import bacaConfig
from mysql.connector import MySQLConnection, Error
import re
import getpass
import string
import random
import time
import datetime
def menuUtama():
    print "###################### DAFTAR MENU UTAMA #######################"
    print "#                1. Register                                   #"
    print "#                2. Login                                      #"
    print "#                3. Checking laundry with ID                   #"
    pilih = input ("Masukan pilihan anda : ")
    if pilih == 1:
        menuRegister()
    elif pilih == 2:
        menuLogin()
    elif pilih == 3:
        print "Belum tersedia"
    else:
        print "Input Error"

def menuRegister():
    print "################## MENU REGISTER ##################"
    varRegister = "False"
    var_register = "False"
    while varRegister == "False":
        user = raw_input("Masukan username : ")
        if all(x.isalpha() or x.isspace() for x in user):
            varRegister = "True"
            if len(user) < 5:
                print "Minimal 5 karakter alphabetical"
                var_register = "False"
            else:
                var_register = "True"
        else:
            print "Harus menggunakan karakter alphabetical"
            varRegister = "False"
    try:
        dbConfig = bacaConfig()
        conn = MySQLConnection(**dbConfig)
        query = conn.cursor()
        query.execute("SELECT * FROM data_register")
        rows = query.fetchall()
        regUser = []
        regA = 0
        regB = 0
        stop = "True"
        terdaftar = "True"

        for row in rows:
            regUser.insert(regA,row[1])
            regA += 1

        while stop == "True" and regB < len(regUser):
            if regUser[regB] == user:
                terdaftar = "True"
                stop = "False"
            else:
                terdaftar = "False"
                stop = "True"
            regB += 1
        if terdaftar == "False":
            print "Username tidak dapat digunakan"
            menuRegister()
        else:
            formRegister(user)
    except Error as e:
        print (e)
def formRegister(user):
    varpswd = "False"
    varPswd = "False"
    varNama = "False"
    varnama = "False"
    varAlamat = "False"
    varalamat = "False"
    varHp = "False"
    varhp = "False"
    varEmail = "False"
    varemail = "False"
    while varPswd == "False" or varpswd == "False":
        pswd = getpass.getpass("Masukan password : ",stream = None)
        if all(x.isalnum() or x.isspace() for x in pswd):
            varPswd = "True"
            if len(pswd) < 5:
                print "Password harus lebih dari 5 karakter"
                varpswd = "False"
            else:
                varpswd = "True"
        else:
            print "Harus menggunakan karakter alphabetical atau numeric"
            varPswd = "False"
    while varNama == "False" or varnama == "False":
        nama = raw_input("Masukan nama anda : ")
        if all(x.isalpha() or x.isspace() for x in user):
            varNama = "True"
            if len(nama) < 5:
                print "Nama harus lebih dari 5 karakter"
                varnama = "False"
            else:
                varnama = "True"
        else:
            print "Harus menggunakan karakter alphabetical"
            varNama = "False"
    akses = "Anggota"
    while varAlamat == "False" or varalamat == "False":
        alamat = raw_input("Masukan alamat anda : ")
        if all(x.isalnum() or x.isspace() for x in pswd):
            varAlamat = "True"
            if len(alamat) < 10:
                print "Alamat harus lebih dari 10 karakter"
                varalamat = "False"
            else:
                varalamat = "True"
        else:
            print "Harus menggunakan karakter alphabetical atau numeric"
            varAlamat = "False"
    while varHp == "False" or varhp == "False":
        hp = raw_input("Masukan nomor hp : ")
        if re.match('^[0-9]*$',hp):
            acdc = len(hp)
            if acdc>10 and acdc<13:
                varhp = "True"
            else:
                print "Oops nomor yang anda masukan sepertinya salah"
                varhp = "False"
            varHp = "True"
        else:
            print "Harus menggunakan karakter numeric"
            varHp = "False"
    while varEmail == "False":
        email = raw_input("Masukan alamat email : ")
        if re.match(r"^[A-Za-z0-9\.\+_-]+@[A-Za-z0-9\._-]+\.[a-zA-Z]*$", email):
            varEmail = "TRUE"
        else:
            print "Bukan email yang benar"
            varEmail = "FALSE"
    saldo = 10000
    query = "INSERT INTO data_register (user,pswd,nama,akses,saldo,alamat,hp,email)"\
            "VALUES (%s,%s,%s,%s,%s,%s,%s,%s)"
    args = (user,pswd,nama,akses,saldo,alamat,hp,email)
    try:
        dbConfig = bacaConfig()
        conn = MySQLConnection(**dbConfig)
        cursor = conn.cursor()
        cursor.execute(query,args)
        if cursor.lastrowid:
            print "Saldo Rp 10.000 sudah ditambahkan ke akun anda"
            print "Terimakasih :) "
            print "Happy Laundry with us"
            print "##########################################################"
            conn.commit()
            backMenu = raw_input("Ingin kembali ke menu utama (y/n)? ")
            if backMenu == "ya" or "Ya" or "YA" or "y" or "Y":
                menuUtama()
            else:
                print "Terimakasih sudah mengunjungi kami"
        else:
            print "Last insert id not found"
        
    except Error as e:
        print (e)
def menuLogin():
    print "################## MENU LOGIN ####################"
    varLogin = "False"
    var_login = "False"
    var_pass = "False"
    varPass = "False"
    while varLogin == "False" or var_login == "False":
        user = raw_input("Masukan username : ")
        if all(x.isalpha() or x.isspace() for x in user):
            varLogin = "True"
            if len(user) < 5:
                print "Username harus lebih dari 5 karakter"
                var_login = "False"
            else:
                var_login = "True"
        else:
            print "Harus menggunakan karakter alphabetical"
            varLogin = "False"
    while varPass == "False":
        pswd = getpass.getpass("Masukan password : ")
        if all(x.isalnum() or x.isspace() for x in pswd):
            varPass = "True"
            if len(pswd) < 5:
                print "Password harus lebih dari 5 karakter"
                var_pass = "False"
            else:
                var_pass = "True"
        else:
            print "Harus menggunakan karakter alphabetical"
            varPass = "False"
    try:
        dbConfig = bacaConfig()
        conn = MySQLConnection(**dbConfig)
        query = conn.cursor()
        query.execute("SELECT * FROM data_register")
        rows = query.fetchall()

        cekUser = []
        cekPswd = []
        cekNama = []
        cekAkses = []
        a = 0
        b = 0
        stop = "True"
        terdaftar = "False"

        for row in rows:
            cekUser.insert(a,row[1])
            cekPswd.insert(a,row[2])
            cekNama.insert(a,row[3])
            cekAkses.insert(a,row[4])
            a +=1
        while stop == "True" and b < len(cekUser):
            if cekUser[b] == user and cekPswd[b] == pswd:
                if cekAkses[b] == "Admin":
                    username = cekUser[b]
                    nama = cekNama[b]
                    menuAdmin(username,nama)
                else:
                    username = cekUser[b]
                    nama = cekUser[b]
                    #menuAnggota(username,nama)
                stop = "False"
                terdaftar = "True"
            else:
                stop = "True"
                terdaftar = "False"
            b+=1
        if terdaftar == "False":
            print "Username dan Password salah"
            menuLogin()
    except Error as e:
        print (e)
def randomTiket(size=10, chars=string.ascii_uppercase+string.digits):
    return ''.join(random.choice(chars) for _ in range(size))

def menuAdmin(username,nama):
    print '################################################'
    print '#                Menu Admin                    #'
    print '#        1. Laundryan Baru'
    print '#        2. Tambah Saldo'
    print '#        3. Cek Log Laundry'
    print '#        4. Cek Log Penambahan Saldo'
    adminPil = input('Masukan pilihan untuk ke menu : ')
    if adminPil == 1:
        inputLaundry(username,nama)
    elif adminPil == 2:
        updateSaldo(username,nama)
    elif adminPil == 3:
        cekLog()
    elif adminPil == 4:
        print "Belum tersedia"
    else:
        print "Input error"
        menuAdmin()
def inputLaundry(username,nama):
    varLogin = "False"
    var_login = "False"
    var_pass = "False"
    varPass = "False"
    while varLogin == "False" or var_login == "False":
        user = raw_input("Masukan username : ")
        if all(x.isalpha() or x.isspace() for x in user):
            varLogin = "True"
            if len(user) < 5:
                print "Username harus lebih dari 5 karakter"
                var_login = "False"
            else:
                var_login = "True"
        else:
            print "Harus menggunakan karakter alphabetical"
            varLogin = "False"
    while varPass == "False":
        pswd = getpass.getpass("Masukan password : ")
        if all(x.isalnum() or x.isspace() for x in pswd):
            varPass = "True"
            if len(pswd) < 5:
                print "Password harus lebih dari 5 karakter"
                var_pass = "False"
            else:
                var_pass = "True"
        else:
            print "Harus menggunakan karakter alphabetical"
            varPass = "False"
    try:
        dbConfig = bacaConfig()
        conn = MySQLConnection(**dbConfig)
        query = conn.cursor()
        query.execute("Select * FROM data_register")
        rows = query.fetchall()
        adUser = []
        adPswd = []
        adAlamat = []
        adSaldo = []
        adNama = []
        a = 0
        b = 0
        stop = "True"
        varTerdaftar = "False"
        for row in rows:
            adUser.insert(a,row[1])
            adPswd.insert(a,row[2])
            adNama.insert(a,row[3])
            adSaldo.insert(a,row[5])
            adAlamat.insert(a,row[6])
            a+=1
        while stop == "True" and b<len(adUser):
            if adUser[b] == user and adPswd[b]==pswd:
                alamat = adAlamat[b]
                saldo = adSaldo[b]
                nama_laundry = adNama[b]
                print ""
                print "################# Data Pengguna ################"
                print "# Nama : ",nama_laundry,"                            "
                print "# Saldo : ",saldo,"                          "
                print "################################################"
                print ""
                data_laundry1(user,saldo,nama_laundry,username,nama)
                stop = "False"
                varTerdaftar = "TRUE"
            else:
                stop = "True"
                varTerdaftar = "FALSE"
            b += 1
        if varTerdaftar == "FALSE":
            print "Pengguna tidak terdaftar"
            inputLaundry()
    except Error as e:
        print (e)
def data_laundry1(user,saldo,nama_laundry,username,nama):
    a = time.localtime()
    today = []
    i = 1
    b = 0
    for i in a:
        today.insert(b,i)
        b+=1
    tanggal = datetime.date(today[0],today[1],today[2])
    kodeLau = randomTiket()
    total = 0
    status = ""
    varBerat = "False"
    varberat = "False"
    print "############### Menu Laundry ####################"
    print "#        1. Cuci laundry                       #"
    print "#        2. Cuci laundry + Setrika             #"
    print "#        3. Cuci laundry + Setrika + Delivery  #"
    pilLaundry = input("Masukan pilihan : ")
    while varBerat == "False" or varberat == "False":
        berat = raw_input("Masukan berat pakaian : ")
        if re.match('^[0-9]*$',berat):
            abc = int(berat)
            if abc < 15:
                varberat = "True"
            else:
                print "Maximal cucian adalah 15Kg"
                varberat = "False"
            varBerat = "True"
        else:
            print "Harus menggunakan numeric"
            varBerat = "False"
    if pilLaundry == 1:
        total = 5000 * abc
    elif pilLaundry == 2:
        total = 7000 * abc
    elif pilLaundry == 3:
        total = 7000 * abc + 3000
    else:
        print "Tidak ada pilihan tersebut"
        data_laundry()
    
    fix_saldo = saldo - total
    if fix_saldo < 0:
        print "Saldo anda tidak mencukupi"
        tambah_saldo = raw_input("Ingin menambah saldo anda (ya/tidak) : ")
        if tambah_saldo == 'y' or 'Y' or 'Ya' or 'YA' or 'ya':
            saldoTambah(kodeLau,user,saldo,fix_saldo,nama_laundry,total,username,nama)
        else:
            print "Mohon maaf pembelian tidak dapat di process"
    else:
        print kodeLau
        print user
        print total
        print tanggal
        status = "Lunas"
        try:
            query1 = "INSERT INTO data_laundry(kodeLau,user_laundry,status,total,log)"\
                     "VALUES (%s,%s,%s,%s,%s)"
            args = (kodeLau,user,status,total,tanggal)
            dbConfig = bacaConfig()
            conn = MySQLConnection(**dbConfig)
            query = conn.cursor()
            query.execute(query1,args)
            conn.commit()
            if query.lastrowid:
                print "Data Laundry berhasil ditambah"
                print "Saldo anda saat ini adalah Rp.",fix_saldo
                print "Terimakasih telah mempercayai kami"
                upQuery = "UPDATE data_register SET saldo = %s WHERE user = %s"
                data = (fix_saldo,user)
                try:
                    dbConfig = bacaConfig()
                    connection = MySQLConnection(**dbConfig)
                    cursor = connection.cursor()
                    cursor.execute(upQuery,data)
                    connection.commit()
                except Error as e:
                    print(e)
                menuAdmin(username,nama)
            else:
                print "Gagal menginput"
            conn.commit()

        except Error as e:
            print (e)
def saldoTambah(kodeLau,user,saldo,fix_saldo,nama_laundry,total,username,nama):
    varTam = "False"
    vartam = "False"
    a = time.localtime()
    today = []
    i = 1
    b = 0
    for i in a:
        today.insert(b,i)
        b+=1
    tanggal = datetime.date(today[0],today[1],today[2])
    print ""
    print "################# Data Pengguna #######################"
    print "Selamat datang ",nama_laundry
    print "Saldo anda saat ini : Rp",saldo
    print "Total pembelanjaan anda : Rp",total
    print "#######################################################"
    print ""
    fix_total = saldo - total
    print "Anda kekurangan saldo sebanyak Rp. ",fix_total
    while varTam == "False" or vartam == "False":
        tamSaldo = raw_input("Berapa banyak saldo yang ingin ditambah : ")
        if re.match('^[0-9]*$',tamSaldo):
            ty = int(tamSaldo)
            if ty > 1000000:
                print "Jumlah maximal tambah saldo adalah Rp 1.000.000"
                vartam = "False"
            else:
                vartam = "True"
            varTam = "True"
        else:
            print "Harus menggunakan karakter numeric"
            varTam = "False"
    fixSaldo = ty + fix_total
    print "Saldo anda saat ini adalah ",ty+fix_total
    if fixSaldo < 0:
        print "Saldo anda masih tidak mencukupi"
        saldoTambah(kodeLau,user,saldo,fix_saldo,nama_laundry,total,username,nama)
    else:
        print "Data laundry berhasil ditambah"
        print "Saldo berhasil ditambah"
        print "Terimakasih telah mempercayai kami"
        status = "Lunas"
        try:
            dbConfig = bacaConfig()
            conn = MySQLConnection(**dbConfig)
            query = conn.cursor()
            query1 = "UPDATE data_register SET saldo = %s WHERE user = %s"
            data1 = (fixSaldo,user)
            query2 = "INSERT INTO data_laundry(kodeLau,user_laundry,status,total,log)"\
                     "VALUES (%s,%s,%s,%s,%s)"
            data2 = (kodeLau,user,status,total,tanggal)
            query3 = "INSERT INTO data_saldo(user,penambah_saldo,penerima_saldo,jum_saldo,log)"\
                     "VALUES (%s,%s,%s,%s,%s)"
            data3 = (user,username,nama_laundry,ty,tanggal)
            query.execute(query1,data1)
            query.execute(query2,data2)
            query.execute(query3,data3)
            conn.commit()
        except Error as e:
            print (e)
def updateSaldo(username,nama):
    a = time.localtime()
    today = []
    i = 1
    b = 0
    for i in a:
        today.insert(b,i)
        b+=1
    tanggal = datetime.date(today[0],today[1],today[2])
    print "################## Data Pengguna #######################"
    varLogin = "False"
    var_login = "False"
    var_pass = "False"
    varPass = "False"
    while varLogin == "False" or var_login == "False":
        user = raw_input("Masukan username : ")
        if all(x.isalpha() or x.isspace() for x in user):
            varLogin = "True"
            if len(user) < 5:
                print "Username harus lebih dari 5 karakter"
                var_login = "False"
            else:
                var_login = "True"
        else:
            print "Harus menggunakan karakter alphabetical"
            varLogin = "False"
    while varPass == "False":
        pswd = getpass.getpass("Masukan password : ")
        if all(x.isalnum() or x.isspace() for x in pswd):
            varPass = "True"
            if len(pswd) < 5:
                print "Password harus lebih dari 5 karakter"
                var_pass = "False"
            else:
                var_pass = "True"
        else:
            print "Harus menggunakan karakter alphabetical"
            varPass = "False"
    print "############################################################"
    try:
        dbConfig = bacaConfig()
        conn = MySQLConnection(**dbConfig)
        query = conn.cursor()
        query.execute("SELECT * from data_register")
        rows = query.fetchall()
        salUser = []
        salPswd = []
        salSaldo = []
        salNama = []
        salA = 0
        salB = 0
        stop = "True"
        pendaftar = "False"
        varTambahin = "False"
        vartambahin = "False"
        for row in rows:
            salUser.insert(salA,row[1])
            salPswd.insert(salA,row[2])
            salSaldo.insert(salA,row[5])
            salNama.insert(salA,row[3])
            salA+=1
        while stop == "True" and salB < len(salUser):
            if salUser[salB] == user and salPswd[salB] == pswd:
                print ""
                print "##################### Data pengguna ####################"
                print "# Selamat datang",salNama[b]
                print "# Sisa saldo anda : Rp",salSaldo[b]
                print "#######################################################"
                while varTambahin == "False" or vartambahin == "False":
                    tambahin = raw_input("Masukan saldo yang ingin ditambah : ")
                    if re.match('^[0-9]*$',tambahin):
                        ghj = int(tambahin)
                        if ghj > 1000000 and ghj > -1:
                            print "Saldo yang ditambahkan tidak boleh melebihi Rp 1.000.000"
                            vartambahin = "False"
                        else:
                            vartambahin = "True"
                        varTambahin = "True"
                    else:
                        print "Harus menggunakan karakter numeric"
                        varTambahin = "False"
                total = salSaldo[b] + ghj
                fix_user = salUser[b]
                penerima = salNama[b]
                stop = "False"
                pendaftar = "True"
                try:
                    dbConfig = bacaConfig()
                    conn = MySQLConnection(**dbConfig)
                    query = conn.cursor()
                    query1 = "UPDATE data_register SET saldo = %s WHERE user = %s"
                    data1 = (total,fix_user)
                    query2 = "INSERT INTO data_saldo(user,penambah_saldo,penerima_saldo,jum_saldo,log)"\
                             "VALUES(%s,%s,%s,%s,%s)"
                    data2 = (fix_user,username,penerima,total,tanggal)
                    query.execute(query1,data1)
                    query.execute(query2,data2)
                    conn.commit()
                    print "Saldo atas nama",fix_user," berhasil ditambahkan"
                    print "Saldo berhasil ditambahkan sebanyak",ghj
                    print "Jumlah saldo anda sekarang ",total
                    print "Terimakasih telah mempercayai kami"
                except Error as e:
                    print (e)
            else:
                stop = "True"
                pendaftar = "False"
            salB += 1
        if pendaftar == "False":
            print "Pengguna tidak terdaftar"
            updateSaldo(username,nama)
    except Error as e:
        print (e)
def cekLog():
     print "########################################"
     print "            CEK LOG LAUNDRY             "
     print "########################################"
     print "#       1. Perhari                     #"
     print "#       2. Perminggu                   #"
     print "#       3. Perbulan                    #"
     pilLog = input("Silahkan Pilih menu : ")
     if pilLog == 1:
         logPerhari()
     elif pilLog == 2:
         logPerminggu()
     elif pilLog == 3:
         logPerbulan()
     else:
         print "Menu tidak tersedia "
         cekLog()

def logPerhari():
    a = time.localtime()
    today = []
    i = 1
    z = 0
    for i in a:
        today.insert(z,i)
        z+=1
    print 'Log laundry perhari'
    try:
        dbConfig = bacaConfig()
        conn = MySQLConnection(**dbConfig)
        cursor = conn.cursor()
        hire_end = datetime.date(today[0],today[1],today[2])
        query = ("SELECT kodeLau,user_laundry,total, log FROM data_laundry WHERE log = '%s'")%(hire_end)
        cursor.execute(query)
        rows = cursor.fetchall()
        nmr = 0
        fix = 0
        fix_total = 0
        print "No   Kode Laundry    Tanggal         Total       User"
        for(kodeLau,log,total,user_laundry) in rows:
            print nmr+1,"  ",kodeLau,"      ",user_laundry,"    ",total,"    ",log
            fix_total += int(total)
            nmr+=1
        print ""
        print "Keuntungan hari ini terhitung",hire_end," sebanyak Rp.",fix_total
        print ""
        #backLog()
    except Error as e:
        print (e)

def logPerminggu():
    a = time.localtime()
    today = []
    i = 1
    z = 0
    b = 1
    c = 0
    hasil = 1
    for i in a:
        today.insert(z,i)
        z+=1
    minggu = today[2] - 7
    bulan = today[1]
    if minggu < 0:
        minggu += 30
        bulan -= 1
    print 'Log laundry perminggu'
    try:
        dbConfig = bacaConfig()
        conn = MySQLConnection(**dbConfig)
        cursor = conn.cursor()
        query = ("SELECT kodeLau,user_laundry,total,log FROM data_laundry WHERE log between %s and %s")
        hire_end = datetime.date(today[0],today[1],today[2])
        hire_start = datetime.date(today[0],bulan,minggu)
        cursor.execute(query,(hire_start,hire_end))
        rows = cursor.fetchall()
        nmr = 0
        fix = 0
        fix_total = 0
        print "No   Kode Laundry    Tanggal         Total       User"
        for(kodeLau,log,total,user_laundry) in rows:
            print nmr+1,"  ",kodeLau,"    ",user_laundry,"    ",int(total),"    ",log
            fix_total += int(total)
            nmr+=1
        print ""
        print "Keuntungan hari ini terhitung",hire_start,"hingga",hire_end,"sebanyak Rp.",fix_total
        print ""
        #backLog()
    except Error as e:
        print (e)

def logPerbulan():
    a = time.localtime()
    today = []
    i = 1
    z = 0
    b = 1
    c = 0
    hasil = 1
    for i in a:
        today.insert(z,i)
        z+=1
    minggu = today[2] - 30
    bulan = today[1]
    if minggu < 0:
        minggu += 30
        bulan -= 1
    print 'Log laundry perbulan'
    try:
        dbConfig = bacaConfig()
        conn = MySQLConnection(**dbConfig)
        cursor = conn.cursor()
        query = ("SELECT kodeLau,user_laundry,total,log FROM data_laundry WHERE log between %s and %s")
        hire_end = datetime.date(today[0],today[1],today[2])
        hire_start = datetime.date(today[0],bulan,minggu)
        cursor.execute(query,(hire_start,hire_end))
        rows = cursor.fetchall()
        nmr = 0
        fix = 0
        fix_total = 0
        print "No   Kode Laundry    Tanggal         Total       User"
        for(kodeLau,log,total,user_laundry) in rows:
            print nmr+1,"  ",kodeLau,"    ",user_laundry,"    ",int(total),"    ",log
            fix_total += int(total)
            nmr+=1
        print ""
        print "Keuntungan hari ini terhitung",hire_start,"hingga",hire_end,"sebanyak Rp.",fix_total
        print ""
        #backLog()
    except Error as e:
        print (e)

def backLog():
    print '#######################################'
    print '1. Kembali ke menu log'
    print '2. Kembali ke menu utama'
    backing = input('Silahkan pilih : ')
    if backing == 1:
        cekLog()
    elif backing == 2:
        menu_utama()
    else:
        print 'Tidak ada pilihan berikut'
        backLog()
def cekSaldo():
    print "########################################"
    print "            CEK LOG SALDO               "
    print "########################################"
    print "#       1. Perhari                     #"
    print "#       2. Perminggu                   #"
    print "#       3. Perbulan                    #"
    cek_saldo = input('Masukan pilihan anda :')
    if cek_saldo == 1:
        saldoHari()
    elif cek_saldo == 2:
        saldoMinggu()
    elif cek_saldo == 3:
        saldoBulan()
    else:
        print "Nomor berikut tidak ada"
        cekSaldo()

def saldoHari():
    a = time.localtime()
    today = []
    i = 1
    z = 0
    for i in a:
        today.insert(z,i)
        z+=1
    print 'Log laundry saldo harian'
    try:
        dbConfig = bacaConfig()
        conn = MySQLConnection(**dbConfig)
        cursor = conn.cursor()
        hire_end = datetime.date(today[0],today[1],today[2])
        query = ("SELECT user,penambah_saldo,penerima_saldo,jum_saldo,log FROM data_saldo WHERE log = '%s'")%(hire_end)
        cursor.execute(query)
        rows = cursor.fetchall()
        nmr = 0
        fix = 0
        fix_total = 0
        print "No   Pengirim      Penerima    Tanggal   Jumlah"
        for(user,penambah_saldo,penerima_saldo,jum_saldo,log) in rows:
            print nmr+1,"  ",penambah_saldo,"      ",penerima_saldo,"    ",log,"    ",jum_saldo
            fix_total += int(total)
            nmr+=1
        print ""
        print ""
        #backLog()
    except Error as e:
        print (e)

def saldoMinggu():
    a = time.localtime()
    today = []
    i = 1
    z = 0
    b = 1
    c = 0
    hasil = 1
    for i in a:
        today.insert(z,i)
        z+=1
    minggu = today[2] - 7
    bulan = today[1]
    if minggu < 0:
        minggu += 30
        bulan -= 1
    print 'Log laundry saldo mingguan'
    try:
        dbConfig = bacaConfig()
        conn = MySQLConnection(**dbConfig)
        cursor = conn.cursor()
        query = ("SELECT user,penambah_saldo,penerima_saldo,jum_saldo,log FROM data_saldo WHERE log between %s and %s")
        hire_end = datetime.date(today[0],today[1],today[2])
        hire_start = datetime.date(today[0],bulan,minggu)
        cursor.execute(query,(hire_start,hire_end))
        rows = cursor.fetchall()
        nmr = 0
        print "No   Pengirim     Penerima            Tanggal         Jumlah"
        for(user,penambah_saldo,penerima_saldo,jum_saldo,log) in rows:
            print nmr+1,"  ",penambah_saldo,"      ",penerima_saldo,"    ",log,"    ",jum_saldo
            nmr+=1
        print ""
        print ""
        #backLog()
    except Error as e:
        print (e)
def saldoBulan():
    a = time.localtime()
    today = []
    i = 1
    z = 0
    b = 1
    c = i0
    hasil = 1
    for i in a:
        today.insert(z,i)
        z+=1
    minggu = today[2] - 30
    bulan = today[1]
    if minggu < 0:
        minggu += 30
        bulan -= 1
    print 'Log laundry saldo mingguan'
    try:
        dbConfig = bacaConfig()
        conn = MySQLConnection(**dbConfig)
        cursor = conn.cursor()
        query = ("SELECT user,penambah_saldo,penerima_saldo,jum_saldo,log FROM data_saldo WHERE log between %s and %s")
        hire_end = datetime.date(today[0],today[1],today[2])
        hire_start = datetime.date(today[0],bulan,minggu)
        cursor.execute(query,(hire_start,hire_end))
        rows = cursor.fetchall()
        nmr = 0
        print "No   Pengirim     Penerima            Tanggal         Jumlah"
        for(user,penambah_saldo,penerima_saldo,jum_saldo,log) in rows:
            print nmr+1,"  ",penambah_saldo,"      ",penerima_saldo,"    ",log,"    ",jum_saldo
            nmr+=1
        print ""
        print ""
        #backLog()
    except Error as e:
        print (e)
def backSaldo():
    print '#######################################'
    print '1. Kembali ke menu log'
    print '2. Kembali ke menu utama'
    print ''
    bak = input('Masukan pilihan anda ; ')
    if bak == 1:
        menuUtama()
    elif bak == 2:
        cekSaldo()
    else:
        print "Tidak ada pilihan berikut"
        backSaldo()
        
menuUtama()
