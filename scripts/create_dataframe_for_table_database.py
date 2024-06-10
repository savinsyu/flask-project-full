# Подключаем библиотеку sqlite3
import sqlite3
import pandas as pd

# Подключаемся в базе данных
con = sqlite3.connect("P:/s.savin/flask-project-full/database.db")
cur = con.cursor()
res = cur.execute("SELECT * FROM links")
result = res.fetchall()
df = pd.DataFrame(result, columns=[c[0] for c in cur.description])
