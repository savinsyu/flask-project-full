import sqlite3

from flask import render_template, app


@app.route('/analytics')
def analytics():
    conn = sqlite3.connect('database.db')
    cur = conn.cursor()
    bash_list_count = cur.execute("SELECT COUNT(*) FROM bash")
    bash_list_count_print = bash_list_count.fetchone()
    bash_list_count_print_int = int(bash_list_count_print[0])
    sql_list_count = cur.execute("SELECT COUNT(*) FROM sql")
    sql_list_count_print = sql_list_count.fetchone()
    sql_list_count_print_int = int(sql_list_count_print[0])
    python_list_count = cur.execute("SELECT COUNT(*) FROM python")
    python_list_count_print = python_list_count.fetchone()
    python_list_count_print_int = int(python_list_count_print[0])
    links_list_count = cur.execute("SELECT COUNT(*) FROM links")
    links_list_count_print = links_list_count.fetchone()
    links_list_count_print_int = int(links_list_count_print[0])
    last_links = conn.execute("SELECT * FROM links ORDER BY 1 DESC").fetchone()
    last_sql = conn.execute("SELECT * FROM sql ORDER BY 1 DESC").fetchone()
    last_bash = conn.execute("SELECT * FROM bash ORDER BY 1 DESC").fetchone()
    last_python = conn.execute("SELECT * FROM python ORDER BY 1 DESC").fetchone()
    return render_template("analytics.html",
                           last_links=last_links,
                           last_sql=last_sql,
                           last_bash=last_bash,
                           last_python=last_python,
                           bash_list_count_print_int=bash_list_count_print_int,
                           sql_list_count_print_int=sql_list_count_print_int,
                           python_list_count_print_int=python_list_count_print_int,
                           links_list_count_print_int=links_list_count_print_int,
                           )
