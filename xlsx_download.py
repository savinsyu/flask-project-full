import os.path
import sqlite3
import pandas as pd

BASE_DIR = os.path.dirname(os.path.abspath(__file__))


def get_db_connection():
    db_path = os.path.join(BASE_DIR, "database.db")
    conn = sqlite3.connect(db_path)
    conn.row_factory = sqlite3.Row
    return conn


def close_db_connection(conn):
    conn.close()


conn = get_db_connection()
bash_list = conn.execute("SELECT * FROM bash").fetchall()
df = pd.DataFrame(bash_list)
df.to_excel(r'bash_xlsx.xlsx', index=False)
conn.close()
