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
            add_column = "ALTER TABLE test_vista.client ADD COLUMN gender VARCHAR (20)"
            cursor.execute(add_column)
            print('Column created')       
    finally:
        connection.close()
except Exception as ex:
    print('Connection failed')
    print(ex)
