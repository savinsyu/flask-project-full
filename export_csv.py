import csv
import sqlite3

with (open("database.csv", mode="w", newline="") as f):
    writer = csv.writer(f)
    conn = sqlite3.connect("database.db")
    cursor = conn.cursor()

    cursor.execute("SELECT * FROM `sandbox`")
    for row in cursor:
        print(row)
        writer.writerow(row)
    conn.close()
print(' Backup performed successfully!')

