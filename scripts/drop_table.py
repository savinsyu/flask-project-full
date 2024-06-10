import sqlite3
con = sqlite3.connect("P:/s.savin/flask-project-full/database.db")
cur = con.cursor()
res = cur.execute("DROP TABLE table_name")
con.commit()