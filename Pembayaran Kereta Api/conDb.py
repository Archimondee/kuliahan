import ConfigParser
def configDb(filename='config.ini',section='dbKereta'):

    #Pengisian config
    parser = ConfigParser.ConfigParser()
    parser.read(filename)

    #Membuat dictionary dari section
    db={}
    if parser.has_section(section):
        items = parser.items(section)
        for item in items:
            db[item[0]] = item[1]
    else:
        raise Exception('File tidak ada'.format(section,filename))
    return db
    
