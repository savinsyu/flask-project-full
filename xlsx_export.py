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
sql_list = conn.execute("SELECT * FROM sql").fetchall()
python_list = conn.execute("SELECT * FROM python").fetchall()
links_list = conn.execute("SELECT * FROM links ORDER BY 1 DESC").fetchall()
df_sql_list = pd.DataFrame(sql_list)
df_python_list = pd.DataFrame(python_list)
df_links_list = pd.DataFrame(links_list)
df_bash_list = pd.DataFrame(bash_list)
with pd.ExcelWriter('xlsx_export/output.xlsx') as writer:
    df_sql_list.to_excel(writer, sheet_name='SQL', header=False, index=False)
    df_python_list.to_excel(writer, sheet_name='Python', header=False, index=False)
    df_links_list.to_excel(writer, sheet_name='Links', header=False, index=False)
    df_bash_list.to_excel(writer, sheet_name='Bash', header=False, index=False)
conn.close()


