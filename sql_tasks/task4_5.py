import pymysql
from config import HOST, PORT, USER, PASSWORD, DB_NAME


try:
    connection = pymysql.connect(
        host = HOST,
        port = PORT,
        user = USER,
        password = PASSWORD,
        database = DB_NAME,
        cursorclass = pymysql.cursors.DictCursor
    )
    print('Connection success')
    try:
        with connection.cursor() as cursor:
            create_org = "CREATE TABLE Organizations(id int NOT NULL AUTO_INCREMENT,"\
                         " title varchar(255) NOT NULL,"\
                         " INN varchar(255) NOT NULL,"\
                         " addres varchar(255) NOT NULL,"\
                         " phone varchar(255) NOT NULL,"\
                         " deleted tinyint(1) NOT NULL, PRIMARY KEY (id));"
            relations = "ALTER TABLE Contact ADD CONSTRAINT Contact_fk0 FOREIGN KEY (payer_id) REFERENCES Organizations(id);"
            cursor.execute(create_org)
            cursor.execute(relations)
            print('Table created')       
    finally:
        connection.close()
except Exception as ex:
    print('Connection failed')
    print(ex)
