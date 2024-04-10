import sqlite3

def get_db_connection():
    conn = sqlite3.connect("database.db")
    conn.row_factory = sqlite3.Row
    return conn

conn = get_db_connection()
conn.execute("DELETE FROM sandbox")
conn.commit()
conn.close()
