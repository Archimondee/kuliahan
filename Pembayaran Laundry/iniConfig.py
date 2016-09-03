import ConfigParser, os
def bacaConfig(filename='config.ini', section='tugas'):
    """Jangan di ganti databasenya, nanti bakalan Error lho
    :kalo mau di ganti bilang dulu biar kagak Error
    """

    #Pembuatan parser dan membaca file config yang ada di file.ini
    parser = ConfigParser.ConfigParser()
    parser.read(filename)

    #Mengambil section bernama mysql yang ada di file.ini
    db = {}
    if parser.has_section(section):
        items = parser.items(section)
        for item in items:
            db[item[0]] = item[1]
    else:
         raise Exception('File tidak ditemukan'.format(section,filename))
    return db
