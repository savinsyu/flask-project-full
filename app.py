from flask import Flask, render_template, request, redirect, url_for, flash

from modules import export_tables_sql_to_xlsx, dump, connect

app = Flask(__name__)

app.secret_key = "secret key"


# RUS Пишем логику для отображения страницы с 404 ошибкой
# ENG Handling 404 Error in Flask
@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404


def close_db_connection(conn):
    conn.close()


# Запускаем функцию модуля создания дампа
export_tables_sql_to_xlsx.export_tables_sql_to_xlsx()

# Запускаем функцию модуля создания дампа
dump.dump()


@app.route("/")
def index():
    return render_template("index.html")


@app.route('/analytics')
def analytics():
    conn = connect.get_db_connection()
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


@app.route("/bash")
def bash_list_commands():
    conn = connect.get_db_connection()
    bash_list = conn.execute("SELECT * FROM bash ORDER BY bash_id DESC").fetchall()
    conn.close()
    return render_template("bash/bash_list_commands.html",
                           bash_list=bash_list,
                           )


@app.route("/bash/view/<int:bash_id>")
def get_post_bash_command(bash_id):
    conn = connect.get_db_connection()
    bash_view = conn.execute("SELECT * FROM bash WHERE bash_id = ?",
                             (bash_id,)).fetchone()
    conn.close()
    return render_template("bash/bash_view_command.html",
                           bash_view=bash_view)


@app.route("/bash/edit/<int:bash_id>/", methods=("GET", "POST"))
def edit_bash_command(bash_id):
    conn = connect.get_db_connection()
    edit_bash_command_view = conn.execute("SELECT * FROM bash WHERE bash_id = ?",
                                          (bash_id,)).fetchone()
    if request.method == "POST":
        bash_command_edit = request.form["bash_command"]
        bash_name_edit = request.form["bash_name"]
        if len(request.form['bash_command']) > 1 and len(request.form['bash_name']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "UPDATE bash SET bash_command = ?, bash_name = ?  WHERE bash_id = ?",
                (bash_command_edit, bash_name_edit, bash_id),
            )
            conn.commit()
            conn.close()
            if not bash_command_edit:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='error')
            else:
                flash('Запись успешно сохранена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("bash_list_commands"))

        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("bash/edit_bash_command.html", edit_bash_command_view=edit_bash_command_view)


@app.route("/bash/new_bash_command", methods=["GET", "POST"])
def add_bash_command():
    if request.method == "POST":
        new_bash_command = request.form["bash_command"]
        new_bash_name = request.form["bash_name"]

        if len(request.form['bash_command']) > 1 and len(request.form['bash_name']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "INSERT INTO bash (bash_command, bash_name) VALUES (?, ?)",
                (new_bash_command, new_bash_name)
            )
            conn.commit()
            conn.close()
            if not new_bash_command:
                flash('Ошибка сохранения записи, Вы ввели слишком мало символов!', category='error')
            else:
                flash('Запись успешно добавлена!')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("bash_list_commands"))

        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("bash/add_bash_command.html")


@app.route("/bash/delete/<int:bash_id>/", methods=("POST",))
def delete_bash_command(bash_id):
    conn = connect.get_db_connection()
    conn.execute("DELETE FROM bash WHERE bash_id = ?",
                 (bash_id,))
    conn.commit()
    conn.close()
    return redirect(url_for("bash_list_commands"))


@app.route("/sql")
def sql_list_commands():
    conn = connect.get_db_connection()
    sql_list = conn.execute("SELECT * FROM sql ORDER BY sql_id DESC").fetchall()
    conn.close()
    return render_template("sql/sql_list_commands.html",
                           sql_list=sql_list,
                           )


@app.route("/sql/view/<int:sql_id>")
def get_post_sql_command(sql_id):
    conn = connect.get_db_connection()
    sql_view = conn.execute("SELECT * FROM sql WHERE sql_id = ?",
                            (sql_id,)).fetchone()
    conn.close()
    return render_template("sql/sql_view_command.html",
                           sql_view=sql_view)


@app.route("/sql/edit/<int:sql_id>/", methods=("GET", "POST"))
def edit_sql_command(sql_id):
    conn = connect.get_db_connection()
    edit_sql_command_view = conn.execute("SELECT * FROM sql WHERE sql_id = ?",
                                         (sql_id,)).fetchone()
    if request.method == "POST":
        sql_command_edit = request.form["sql_command"]
        sql_name_edit = request.form["sql_name"]
        # Поле description не обязательное, поэтому не будет делать условие
        sql_description_edit = request.form["sql_description"]
        if len(request.form['sql_command']) > 4 and len(request.form['sql_name']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "UPDATE sql SET sql_command = ?, sql_name = ?, sql_description = ? WHERE sql_id = ?",
                (sql_command_edit, sql_name_edit, sql_description_edit, sql_id),
            )
            conn.commit()
            conn.close()
            if not sql_command_edit:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='error')
            else:
                flash('Запись успешно сохранена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("sql_list_commands"))
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("sql/edit_sql_command.html", edit_sql_command_view=edit_sql_command_view)


@app.route("/sql/new_sql_command", methods=["GET", "POST"])
def add_sql_command():
    if request.method == "POST":
        new_sql_command = request.form["sql_command"]
        new_sql_name = request.form["sql_name"]
        # Поле description не обязательное, поэтому не будет делать условие
        new_sql_description = request.form["sql_description"]
        if len(request.form['sql_command']) > 4 and len(request.form['sql_name']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "INSERT INTO sql (sql_command, sql_name, sql_description) VALUES (?, ?, ?)",
                (new_sql_command, new_sql_name, new_sql_description)
            )
            conn.commit()
            conn.close()
            if not new_sql_command:
                flash('Ошибка сохранения записи!', category='error')
            else:
                flash('Запись успешно добавлена!')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("sql_list_commands"))
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("sql/add_sql_command.html")


@app.route("/sql/delete/<int:sql_id>/", methods=("POST",))
def delete_sql_command(sql_id):
    conn = connect.get_db_connection()
    conn.execute("DELETE FROM sql WHERE sql_id = ?",
                 (sql_id,))
    conn.commit()
    conn.close()
    return redirect(url_for("sql_list_commands"))


# Блок python
@app.route("/python")
def python_list_commands():
    conn = connect.get_db_connection()
    python_list = conn.execute("SELECT * FROM python ORDER BY 1 DESC").fetchall()
    conn.close()
    return render_template("python/python_list_commands.html",
                           python_list=python_list,
                           )


@app.route("/python/view/<int:python_id>")
def get_post_python_command(python_id):
    conn = connect.get_db_connection()
    python_view = conn.execute("SELECT * FROM python WHERE python_id = ?",
                               (python_id,)).fetchone()
    conn.close()
    return render_template("python/python_view_command.html",
                           python_view=python_view)


@app.route("/python/edit/<int:python_id>/", methods=("GET", "POST"))
def edit_python_command(python_id):
    conn = connect.get_db_connection()
    edit_python_command_view = conn.execute("SELECT * FROM python WHERE python_id = ?",
                                            (python_id,)).fetchone()
    if request.method == "POST":
        python_command_edit = request.form["python_command"]
        python_name_edit = request.form["python_name"]
        # Поле description не обязательное, поэтому не будет делать условие
        python_description_edit = request.form["python_description"]
        if len(request.form['python_command']) > 4 and len(request.form['python_name']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "UPDATE python SET python_command = ?, python_name = ?, python_description = ? WHERE python_id = ?",
                (python_command_edit, python_name_edit, python_description_edit, python_id),
            )
            conn.commit()
            conn.close()
            if not python_command_edit:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='error')
            else:
                flash('Запись успешно сохранена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("python_list_commands"))
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("python/edit_python_command.html", edit_python_command_view=edit_python_command_view)


@app.route("/python/new_python_command", methods=["GET", "POST"])
def add_python_command():
    if request.method == "POST":
        new_python_command = request.form["python_command"]
        new_python_name = request.form["python_name"]
        # Поле description не обязательное, поэтому не будет делать условие
        new_python_description = request.form["python_description"]
        if len(request.form['python_command']) > 4 and len(request.form['python_name']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "INSERT INTO python (python_command, python_name, python_description) VALUES (?, ?, ?)",
                (new_python_command, new_python_name, new_python_description)
            )
            conn.commit()
            conn.close()
            if not new_python_command:
                flash('Ошибка сохранения записи!', category='error')
            else:
                flash('Запись успешно добавлена!')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("python_list_commands"))
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("python/add_python_command.html")


@app.route("/python/delete/<int:python_id>/", methods=("POST",))
def delete_python_command(python_id):
    conn = connect.get_db_connection()
    conn.execute("DELETE FROM python WHERE python_id = ?",
                 (python_id,))
    conn.commit()
    conn.close()
    return redirect(url_for("python_list_commands"))


# Блок links
@app.route("/links")
def links_list_commands():
    conn = connect.get_db_connection()
    links_list = conn.execute("SELECT * FROM links ORDER BY links_id DESC").fetchall()
    conn.close()

    return render_template("links/links_list_commands.html",
                           links_list=links_list,
                           )


@app.route("/links/view/<int:links_id>")
def get_post_links_command(links_id):
    conn = connect.get_db_connection()
    links_view = conn.execute("SELECT * FROM links WHERE links_id = ?",
                              (links_id,)).fetchone()
    conn.close()
    return render_template("links/links_view_command.html",
                           links_view=links_view)


@app.route("/links/edit/<int:links_id>/", methods=("GET", "POST"))
def edit_links_command(links_id):
    conn = connect.get_db_connection()
    edit_links_command_view = conn.execute("SELECT * FROM links WHERE links_id = ?",
                                           (links_id,)).fetchone()
    if request.method == "POST":
        links_command_edit = request.form["links_command"]
        links_name_edit = request.form["links_name"]
        # Поле description не обязательное, поэтому не будет делать условие
        links_description_edit = request.form["links_description"]
        if len(request.form['links_command']) > 4 and len(request.form['links_name']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "UPDATE links SET links_command = ?, links_name = ?, links_description = ? WHERE links_id = ?",
                (links_command_edit, links_name_edit, links_description_edit, links_id),
            )
            conn.commit()
            conn.close()
            if not links_command_edit:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='error')
            else:
                flash('Запись успешно сохранена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("links_list_commands"))
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("links/edit_links_command.html", edit_links_command_view=edit_links_command_view)


@app.route("/links/new_links_command", methods=["GET", "POST"])
def add_links_command():
    if request.method == "POST":
        new_links_command = request.form["links_command"]
        new_links_name = request.form["links_name"]
        # Поле description не обязательное, поэтому не будет делать условие
        new_links_description = request.form["links_description"]
        if len(request.form['links_command']) > 4 and len(request.form['links_name']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "INSERT INTO links (links_command, links_name, links_description) VALUES (?, ?, ?)",
                (new_links_command, new_links_name, new_links_description)
            )
            conn.commit()
            conn.close()
            if not new_links_command:
                flash('Ошибка сохранения записи!', category='error')
            else:
                flash('Запись успешно добавлена!')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("links_list_commands"))
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("links/add_links_command.html")


@app.route("/links/delete/<int:links_id>/", methods=("POST",))
def delete_links_command(links_id):
    conn = connect.get_db_connection()
    conn.execute("DELETE FROM links WHERE links_id = ?",
                 (links_id,))
    conn.commit()
    conn.close()
    return redirect(url_for("links_list_commands"))


@app.route("/tasks")
def get_tasks_list():
    conn = connect.get_db_connection()
    tasks_list = conn.execute("SELECT * FROM tasks ORDER BY task_id DESC").fetchall()
    conn.close()
    return render_template("tasks/tasks_list.html",
                           tasks_list=tasks_list,
                           )


@app.route("/tasks/view/<int:task_id>")
def get_post_task(task_id):
    conn = connect.get_db_connection()
    task_view = conn.execute("SELECT * FROM tasks WHERE task_id = ?",
                             (task_id,)).fetchone()
    conn.close()
    return render_template("tasks/task_view.html",
                           task_view=task_view)


@app.route("/tasks/edit/<int:task_id>/", methods=("GET", "POST"))
def get_edit_task(task_id):
    conn = connect.get_db_connection()
    edit_task_view = conn.execute("SELECT * FROM tasks WHERE task_id = ?",
                                  (task_id,)).fetchone()
    if request.method == "POST":
        task_edit_name = request.form["task_name"]
        if len(request.form['task_name']) > 4:
            conn = connect.get_db_connection()
            conn.execute(
                "UPDATE tasks SET task_name = ? WHERE task_id = ?",
                (task_edit_name, task_id),
            )
            conn.commit()
            conn.close()
            if not task_edit_name:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='error')
            else:
                flash('Запись успешно сохранена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("get_tasks_list"))
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("tasks/edit_task.html", edit_task_view=edit_task_view)


@app.route("/tasks/new_task", methods=["GET", "POST"])
def new_task():
    if request.method == "POST":
        new_task_name = request.form["task_name"]
        if len(request.form['task_name']) > 4:
            conn = connect.get_db_connection()
            conn.execute(
                "INSERT INTO tasks (task_name) VALUES (?)",
                (new_task_name,)
            )
            conn.commit()
            conn.close()
            if not new_task_name:
                flash('Ошибка сохранения записи!', category='error')
            else:
                flash('Запись успешно добавлена!')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("get_tasks_list"))
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("tasks/new_task.html")


@app.route("/tasks/delete/<int:task_id>/", methods=("POST",))
def delete_task(task_id):
    conn = connect.get_db_connection()
    conn.execute("DELETE FROM tasks WHERE task_id = ?",
                 (task_id,))
    conn.commit()
    conn.close()
    return redirect(url_for("get_tasks_list"))


@app.route("/values")
def values():
    conn = connect.get_db_connection()
    values_list = conn.execute("SELECT * FROM values_tbl ORDER BY value_id DESC").fetchall()
    conn.close()

    return render_template("values/values.html",
                           values_list=values_list,
                           )


@app.route("/values/view/<int:value_id>")
def get_post_value(value_id):
    conn = connect.get_db_connection()
    value_view = conn.execute("SELECT * FROM values_tbl WHERE value_id = ?",
                               (value_id,)).fetchone()
    conn.close()
    return render_template("values/value_view.html",
                           value_view=value_view)


@app.route("/values/edit/<int:value_id>/", methods=("GET", "POST"))
def edit_value(value_id):
    conn = connect.get_db_connection()
    edit_value_view = conn.execute("SELECT * FROM values_tbl WHERE value_id = ?",
                                    (value_id,)).fetchone()
    if request.method == "POST":
        value_edit = request.form["value"]
        value_name_edit = request.form["value_name"]
        if len(request.form['value_name']) > 5:
            conn = connect.get_db_connection()
            conn.execute(
                "UPDATE values_tbl SET value = ?, value_name = ? WHERE value_id = ?",
                (value_edit, value_name_edit, value_id),
            )
            conn.commit()
            conn.close()
            if not value_name_edit:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='error')
            else:
                flash('Запись успешно сохранена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("values"))
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("values/edit_value.html", edit_value_view=edit_value_view)


@app.route("/values/new_value", methods=["GET", "POST"])
def add_value():
    if request.method == "POST":
        new_value_name = request.form["value_name"]
        new_value = request.form["value"]
        if len(request.form['value_name']) > 5:
            conn = connect.get_db_connection()
            conn.execute(
                "INSERT INTO values_tbl (value_name, value) VALUES (?, ?)",
                (new_value_name, new_value)
            )
            conn.commit()
            conn.close()
            if not new_value_name:
                flash('Ошибка сохранения записи!', category='error')
            else:
                flash('Запись успешно добавлена!')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("values"))
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("values/new_value.html")


@app.route("/values/delete/<int:value_id>/", methods=("POST",))
def delete_values(value_id):
    conn = connect.get_db_connection()
    conn.execute("DELETE FROM values_tbl WHERE value_id = ?",
                 (value_id,))
    conn.commit()
    conn.close()
    return redirect(url_for("values"))


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=82)
