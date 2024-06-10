import sqlite3


def create_tables():
    sql_statements = [
        """CREATE TABLE IF NOT EXISTS main.table_name (
                id INTEGER PRIMARY KEY autoincrement, 
                table_name TEXT not null,
                table_content TEXT not null
        );"""]

    # create a database connection
    try:
        with sqlite3.connect('P:/s.savin/flask-project-full/database.db') as conn:
            cursor = conn.cursor()
            for statement in sql_statements:
                cursor.execute(statement)

            conn.commit()
    except sqlite3.Error as e:
        print(e)


if __name__ == '__main__':
    create_tables()
