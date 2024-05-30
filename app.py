try:
    import sqlite3
    from datetime import datetime as dt
    from datetime import datetime as dt
    from flask import Flask, render_template, request, redirect, url_for, flash, make_response
    from password_generator import generate_password

    print('Все библиотеки установлены.')
except ModuleNotFoundError:
    print('Некоторые библиотеки не установлены.')

app = Flask(__name__)

app.secret_key = "secret key"


@app.route("/password", methods=["POST", "GET"])
def password():
    options = {"debug": None, "language": "en", "spaces": "0", "symbol": "1",
               "uppercase": "1"}
    if request.method == "POST":
        resp = make_response("")
        for k in options:
            # Ensure invalid POST variables are not left unhandled
            try:
                resp.set_cookie(
                    f"fp_{k}", request.form.get(k),
                    max_age=60 * 60 * 24 * 7)
            except KeyError:
                pass
        resp.headers["location"] = "./"
        return resp, 302
    else:
        # Prioritize GET values over cookies
        for k in options:
            try:
                # Set default to ensure existing options are not overridden
                # if HTML query strings or POST variables are not defined
                if request.args.get(k, default=None) is not None:
                    options[k] = request.args.get(k, '')
                elif request.cookies.get(f"fp_{k}", default=None) is not None:
                    options[k] = request.cookies.get(f"fp_{k}")
            except KeyError:
                pass
        password = generate_password(
            language=options["language"], spaces=options["spaces"],
            symbol=options["symbol"], uppercase=options["uppercase"])
        return render_template(
            "generation_password.html", debug=options["debug"], debug_data=options,
            # language=options["language"], release=RELEASE,
            spaces=options["spaces"], symbol=options["symbol"],
            uppercase=options["uppercase"], theme="sea-blue",
            title="Password Generator", password=password, year=dt.now().year,
        )


# RUS Пишем логику для отображения страницы с 404 ошибкой
# ENG Handling 404 Error in Flask
@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404


def get_db_connection():
    conn = sqlite3.connect("database.db")
    conn.row_factory = sqlite3.Row
    return conn


def close_db_connection(conn):
    conn.close()


@app.route("/")
def index():
    conn = get_db_connection()
    last_post = conn.execute("SELECT * FROM links ORDER BY links_id DESC").fetchone()
    return render_template("index.html", last_post=last_post)


# Блок Git
@app.route("/git")
def git_list_commands():
    conn = get_db_connection()
    git_list = conn.execute("SELECT * FROM git ORDER BY 1 DESC").fetchall()
    conn.close()
    return render_template("git/git_list_commands.html",
                           git_list=git_list, )


@app.route("/git/view/<int:git_id>")
def get_post_git_command(git_id):
    conn = get_db_connection()
    git_view = conn.execute("SELECT * FROM git WHERE git_id = ?",
                            (git_id,)).fetchone()
    conn.close()
    return render_template("git/git_view_command.html",
                           git_view=git_view)


@app.route("/git/edit/<int:git_id>/", methods=("GET", "POST"))
def edit_git_command(git_id):
    conn = get_db_connection()
    edit_git_command_view = conn.execute("SELECT * FROM git WHERE git_id = ?",
                                         (git_id,)).fetchone()
    if request.method == "POST":
        git_command_edit = request.form["git_command"]
        git_name_edit = request.form["git_name"]
        # Поле description не обязательное, поэтому не будет делать условие
        git_description_edit = request.form["git_description"]
        if len(request.form['git_command']) > 4 and len(request.form['git_name']) > 10:
            conn = get_db_connection()
            conn.execute(
                "UPDATE git SET git_command = ?, git_name = ?, git_description = ? WHERE git_id = ?",
                (git_command_edit, git_name_edit, git_description_edit, git_id),
            )
            conn.commit()
            conn.close()
            if not git_command_edit:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='error')
            else:
                flash('Запись успешно сохранена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("git_list_commands"))

        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("git/edit_git_command.html", edit_git_command_view=edit_git_command_view)


@app.route("/git/new_git_command", methods=["GET", "POST"])
def add_git_command():
    if request.method == "POST":
        new_git_command = request.form["git_command"]
        new_git_name = request.form["git_name"]
        new_git_description = request.form["git_description"]
        if len(request.form['git_command']) > 4 and len(request.form['git_name']) > 10:
            conn = get_db_connection()
            conn.execute(
                "INSERT INTO git (git_command, git_name, git_description) VALUES (?, ?, ?)",
                (new_git_command, new_git_name, new_git_description)
            )
            conn.commit()
            conn.close()
            if not new_git_command:
                flash('Ошибка сохранения записи!', category='error')
            else:
                flash('Запись успешно добавлена!')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("git_list_commands"))
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("git/add_git_command.html")


@app.route("/git/delete/<int:git_id>/", methods=("POST",))
def delete_git_command(git_id):
    conn = get_db_connection()
    conn.execute("DELETE FROM git WHERE git_id = ?",
                 (git_id,))
    conn.commit()
    conn.close()
    return redirect(url_for("git_list_commands"))


# Блок Bash
@app.route("/bash")
def bash_list_commands():
    conn = get_db_connection()
    bash_list = conn.execute("SELECT * FROM bash ORDER BY 1 DESC").fetchall()
    conn.close()
    return render_template("bash/bash_list_commands.html",
                           bash_list=bash_list, )


@app.route("/bash/view/<int:bash_id>")
def get_post_bash_command(bash_id):
    conn = get_db_connection()
    bash_view = conn.execute("SELECT * FROM bash WHERE bash_id = ?",
                             (bash_id,)).fetchone()
    conn.close()
    return render_template("bash/bash_view_command.html",
                           bash_view=bash_view)


@app.route("/bash/edit/<int:bash_id>/", methods=("GET", "POST"))
def edit_bash_command(bash_id):
    conn = get_db_connection()
    edit_bash_command_view = conn.execute("SELECT * FROM bash WHERE bash_id = ?",
                                          (bash_id,)).fetchone()
    if request.method == "POST":
        bash_command_edit = request.form["bash_command"]
        bash_name_edit = request.form["bash_name"]
        # Поле description не обязательное, поэтому не будет делать условие
        bash_description_edit = request.form["bash_description"]
        if len(request.form['bash_command']) > 1 and len(request.form['bash_name']) > 10:
            conn = get_db_connection()
            conn.execute(
                "UPDATE bash SET bash_command = ?, bash_name = ?, bash_description = ? WHERE bash_id = ?",
                (bash_command_edit, bash_name_edit, bash_description_edit, bash_id),
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
        # Поле description не обязательное, поэтому не будет делать условие
        new_bash_description = request.form["bash_description"]
        if len(request.form['bash_command']) > 1 and len(request.form['bash_name']) > 10:
            conn = get_db_connection()
            conn.execute(
                "INSERT INTO bash (bash_command, bash_name, bash_description) VALUES (?, ?, ?)",
                (new_bash_command, new_bash_name, new_bash_description)
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
    conn = get_db_connection()
    conn.execute("DELETE FROM bash WHERE bash_id = ?",
                 (bash_id,))
    conn.commit()
    conn.close()
    return redirect(url_for("bash_list_commands"))


# Блок SQL
@app.route("/sql")
def sql_list_commands():
    conn = get_db_connection()
    sql_list = conn.execute("SELECT * FROM sql ORDER BY 1 DESC").fetchall()
    conn.close()
    return render_template("sql/sql_list_commands.html",
                           sql_list=sql_list, )


@app.route("/sql/view/<int:sql_id>")
def get_post_sql_command(sql_id):
    conn = get_db_connection()
    sql_view = conn.execute("SELECT * FROM sql WHERE sql_id = ?",
                            (sql_id,)).fetchone()
    conn.close()
    return render_template("sql/sql_view_command.html",
                           sql_view=sql_view)


@app.route("/sql/edit/<int:sql_id>/", methods=("GET", "POST"))
def edit_sql_command(sql_id):
    conn = get_db_connection()
    edit_sql_command_view = conn.execute("SELECT * FROM sql WHERE sql_id = ?",
                                         (sql_id,)).fetchone()
    if request.method == "POST":
        sql_command_edit = request.form["sql_command"]
        sql_name_edit = request.form["sql_name"]
        # Поле description не обязательное, поэтому не будет делать условие
        sql_description_edit = request.form["sql_description"]
        if len(request.form['sql_command']) > 4 and len(request.form['sql_name']) > 10:
            conn = get_db_connection()
            conn.execute(
                "UPDATE sql SET sql_command = ?, sql_name = ?, sql_name = ? WHERE sql_id = ?",
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
            conn = get_db_connection()
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
    conn = get_db_connection()
    conn.execute("DELETE FROM sql WHERE sql_id = ?",
                 (sql_id,))
    conn.commit()
    conn.close()
    return redirect(url_for("sql_list_commands"))


# Блок Pandas
@app.route("/pandas")
def pandas_list_commands():
    conn = get_db_connection()
    pandas_list = conn.execute("SELECT * FROM pandas ORDER BY 1 DESC").fetchall()
    conn.close()
    return render_template("pandas/pandas_list_commands.html",
                           pandas_list=pandas_list, )


@app.route("/pandas/view/<int:pandas_id>")
def get_post_pandas_command(pandas_id):
    conn = get_db_connection()
    pandas_view = conn.execute("SELECT * FROM pandas WHERE pandas_id = ?",
                               (pandas_id,)).fetchone()
    conn.close()
    return render_template("pandas/pandas_view_command.html",
                           pandas_view=pandas_view)


@app.route("/pandas/edit/<int:pandas_id>/", methods=("GET", "POST"))
def edit_pandas_command(pandas_id):
    conn = get_db_connection()
    edit_pandas_command_view = conn.execute(
        "SELECT * FROM pandas WHERE pandas_id = ?",
        (pandas_id,)).fetchone()
    if request.method == "POST":
        pandas_command_edit = request.form["pandas_command"]
        pandas_name_edit = request.form["pandas_name"]
        # Поле description не обязательное, поэтому не будет делать условие
        pandas_description_edit = request.form["pandas_description"]
        if len(request.form['pandas_command']) > 4 and len(request.form['pandas_name']) > 10:
            conn = get_db_connection()
            conn.execute(
                "UPDATE pandas SET pandas_command = ?, pandas_name = ?, pandas_description = ? WHERE pandas_id = ?",
                (pandas_command_edit, pandas_name_edit, pandas_description_edit, pandas_id),
            )
            conn.commit()
            conn.close()
            if not pandas_command_edit:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='error')
            else:
                flash('Запись успешно сохранена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("pandas_list_commands"))
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("pandas/edit_pandas_command.html", edit_pandas_command_view=edit_pandas_command_view)


@app.route("/pandas/new_pandas_command", methods=["GET", "POST"])
def add_pandas_command():
    if request.method == "POST":
        new_pandas_command = request.form["pandas_command"]
        new_pandas_name = request.form["pandas_name"]
        # Поле description не обязательное, поэтому не будет делать условие
        new_pandas_description = request.form["pandas_description"]
        if len(request.form['pandas_command']) > 4 and len(request.form['pandas_name']) > 10:
            conn = get_db_connection()
            conn.execute(
                "INSERT INTO pandas (pandas_command, pandas_name, pandas_description) VALUES (?, ?, ?)",
                (new_pandas_command, new_pandas_name, new_pandas_description)
            )
            conn.commit()
            conn.close()
            if not new_pandas_command:
                flash('Ошибка сохранения записи!', category='error')
            else:
                flash('Запись успешно добавлена!')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("pandas_list_commands"))
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("pandas/add_pandas_command.html")


@app.route("/pandas/delete/<int:pandas_id>/", methods=("POST",))
def delete_pandas_command(pandas_id):
    conn = get_db_connection()
    conn.execute("DELETE FROM pandas WHERE pandas_id = ?",
                 (pandas_id,))
    conn.commit()
    conn.close()
    return redirect(url_for("pandas_list_commands"))


# Блок links
@app.route("/links")
def links_list_commands():
    conn = get_db_connection()
    links_list = conn.execute("SELECT * FROM links").fetchall()
    conn.close()
    return render_template("links/links_list_commands.html",
                           links_list=links_list, )


@app.route("/links/view/<int:links_id>")
def get_post_links_command(links_id):
    conn = get_db_connection()
    links_view = conn.execute("SELECT * FROM links WHERE links_id = ?",
                              (links_id,)).fetchone()
    conn.close()
    return render_template("links/links_view_command.html",
                           links_view=links_view)


@app.route("/links/edit/<int:links_id>/", methods=("GET", "POST"))
def edit_links_command(links_id):
    conn = get_db_connection()
    edit_links_command_view = conn.execute("SELECT * FROM links WHERE links_id = ?",
                                           (links_id,)).fetchone()
    if request.method == "POST":
        links_command_edit = request.form["links_command"]
        links_name_edit = request.form["links_name"]
        # Поле description не обязательное, поэтому не будет делать условие
        links_description_edit = request.form["links_description"]
        if len(request.form['links_command']) > 4 and len(request.form['links_name']) > 10:
            conn = get_db_connection()
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
            conn = get_db_connection()
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
    conn = get_db_connection()
    conn.execute("DELETE FROM links WHERE links_id = ?",
                 (links_id,))
    conn.commit()
    conn.close()
    return redirect(url_for("links_list_commands"))


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=82)
