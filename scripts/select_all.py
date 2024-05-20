# Подключаем библиотеку sqlite3
import sqlite3

# Подключаемся в базе данных
con = sqlite3.connect("../database.db")
cur = con.cursor()
res = cur.execute("SELECT * FROM links")
res.fetchall()
