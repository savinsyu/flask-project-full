import sqlite3
import io


# RUS Создаем подключение к файлу базы данных
# ENG Create a connection to the database file
def dump():
    conn = sqlite3.connect('database.db')

    # RUS Сохраняем в файл дамп базы данных (папка dump)
    # ENG Save the database dump to a file (dump folder)
    with io.open('database_dump/database_dump.sql', 'w') as p:
        # iterdump() function
        for line in conn.iterdump():
            p.write('%s\n' % line)
    print('Дамп базы данных успешно выполнен!!')
    conn.close()
