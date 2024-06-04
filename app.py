try:
    import sqlite3
    from datetime import datetime as dt
    from datetime import datetime as dt
    from flask import Flask, render_template, request, redirect, url_for, flash, make_response
    from password_generator import generate_password
    from models import index

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
    last_links = conn.execute("SELECT * FROM links ORDER BY 1 DESC").fetchone()
    last_git = conn.execute("SELECT * FROM git ORDER BY 1 DESC").fetchone()
    last_pandas = conn.execute("SELECT * FROM pandas ORDER BY 1 DESC").fetchone()
    last_sql = conn.execute("SELECT * FROM sql ORDER BY 1 DESC").fetchone()
    last_bash = conn.execute("SELECT * FROM bash ORDER BY 1 DESC").fetchone()
    last_html = conn.execute("SELECT * FROM html ORDER BY 1 DESC").fetchone()
    last_css = conn.execute("SELECT * FROM css ORDER BY 1 DESC").fetchone()
    last_healthy = conn.execute("SELECT * FROM healthy ORDER BY 1 DESC").fetchone()
    return render_template("index.html",
                           last_links=last_links,
                           last_git=last_git,
                           last_pandas=last_pandas,
                           last_sql=last_sql,
                           last_bash=last_bash,
                           last_css=last_css,
                           last_html=last_html,
                           last_healthy=last_healthy,)


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

# Блок Healthy
@app.route("/healthy")
def healthy_list_posts():
    conn = get_db_connection()
    healthy_list = conn.execute("SELECT * FROM healthy ORDER BY 1 DESC").fetchall()
    conn.close()
    return render_template("healthy/healthy_list_posts.html",
                           healthy_list=healthy_list)


@app.route("/healthy/view/<int:healthy_id>")
def get_post_healthy(healthy_id):
    conn = get_db_connection()
    healthy_view = conn.execute("SELECT * FROM healthy WHERE healthy_id = ?",
                             (healthy_id,)).fetchone()
    conn.close()
    return render_template("healthy/healthy_view_post.html",
                           healthy_view=healthy_view)


@app.route("/healthy/edit/<int:healthy_id>/", methods=("GET", "POST"))
def edit_healthy_post(healthy_id):
    conn = get_db_connection()
    edit_healthy_post_view = conn.execute("SELECT * FROM healthy WHERE healthy_id = ?",
                                          (healthy_id,)).fetchone()
    if request.method == "POST":
        healthy_header_edit = request.form["healthy_header"]
        healthy_content_edit = request.form["healthy_content"]
        if len(request.form['healthy_header']) > 1 and len(request.form['healthy_content']) > 10:
            conn = get_db_connection()
            conn.execute(
                "UPDATE healthy SET healthy_header = ?, healthy_content = ? WHERE healthy_id = ?",
                (healthy_header_edit, healthy_content_edit,  healthy_id),
            )
            conn.commit()
            conn.close()
            if not healthy_content_edit:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='error')
            else:
                flash('Запись успешно сохранена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("healthy_list_posts"))

        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("healthy/edit_healthy_post.html", edit_healthy_post_view=edit_healthy_post_view)


@app.route("/healthy/new_post", methods=["GET", "POST"])
def add_healthy_post():
    if request.method == "POST":
        healthy_header = request.form["healthy_header"]
        healthy_content = request.form["healthy_content"]
        if len(request.form['healthy_header']) > 1 and len(request.form['healthy_content']) > 10:
            conn = get_db_connection()
            conn.execute(
                "INSERT INTO healthy (healthy_header, healthy_content) VALUES (?, ?)",
                (healthy_header, healthy_content)
            )
            conn.commit()
            conn.close()
            if not healthy_content:
                flash('Ошибка сохранения записи, Вы ввели слишком мало символов!', category='error')
            else:
                flash('Запись успешно добавлена!')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("healthy_list_posts"))

        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("healthy/add_healthy_post.html")


@app.route("/healthy/delete/<int:healthy_id>/", methods=("POST",))
def delete_healthy_post(healthy_id):
    conn = get_db_connection()
    conn.execute("DELETE FROM healthy WHERE healthy_id = ?",
                 (healthy_id,))
    conn.commit()
    conn.close()
    return redirect(url_for("healthy_list_posts"))


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


# Блок html
@app.route("/html")
def html_list_commands():
    conn = get_db_connection()
    html_list = conn.execute("SELECT * FROM html ORDER BY 1 DESC").fetchall()
    conn.close()
    return render_template("html/html_list_commands.html",
                           html_list=html_list, )


@app.route("/html/view/<int:html_id>")
def get_post_html_command(html_id):
    conn = get_db_connection()
    html_view = conn.execute("SELECT * FROM html WHERE html_id = ?",
                             (html_id,)).fetchone()
    conn.close()
    return render_template("html/html_view_command.html",
                           html_view=html_view)


@app.route("/html/edit/<int:html_id>/", methods=("GET", "POST"))
def edit_html_command(html_id):
    conn = get_db_connection()
    edit_html_command_view = conn.execute("SELECT * FROM html WHERE html_id = ?",
                                          (html_id,)).fetchone()
    if request.method == "POST":
        html_command_edit = request.form["html_command"]
        html_name_edit = request.form["html_name"]
        # Поле description не обязательное, поэтому не будет делать условие
        html_description_edit = request.form["html_description"]
        if len(request.form['html_command']) > 4 and len(request.form['html_name']) > 10:
            conn = get_db_connection()
            conn.execute(
                "UPDATE html SET html_command = ?, html_name = ?, html_name = ? WHERE html_id = ?",
                (html_command_edit, html_name_edit, html_description_edit, html_id),
            )
            conn.commit()
            conn.close()
            if not html_command_edit:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='error')
            else:
                flash('Запись успешно сохранена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("html_list_commands"))
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("html/edit_html_command.html", edit_html_command_view=edit_html_command_view)


@app.route("/html/new_html_command", methods=["GET", "POST"])
def add_html_command():
    if request.method == "POST":
        new_html_command = request.form["html_command"]
        new_html_name = request.form["html_name"]
        # Поле description не обязательное, поэтому не будет делать условие
        new_html_description = request.form["html_description"]
        if len(request.form['html_command']) > 4 and len(request.form['html_name']) > 10:
            conn = get_db_connection()
            conn.execute(
                "INSERT INTO html (html_command, html_name, html_description) VALUES (?, ?, ?)",
                (new_html_command, new_html_name, new_html_description)
            )
            conn.commit()
            conn.close()
            if not new_html_command:
                flash('Ошибка сохранения записи!', category='error')
            else:
                flash('Запись успешно добавлена!')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("html_list_commands"))
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("html/add_html_command.html")


@app.route("/html/delete/<int:html_id>/", methods=("POST",))
def delete_html_command(html_id):
    conn = get_db_connection()
    conn.execute("DELETE FROM html WHERE html_id = ?",
                 (html_id,))
    conn.commit()
    conn.close()
    return redirect(url_for("html_list_commands"))


# Блок css
@app.route("/css")
def css_list_commands():
    conn = get_db_connection()
    css_list = conn.execute("SELECT * FROM css ORDER BY 1 DESC").fetchall()
    conn.close()
    return render_template("css/css_list_commands.html",
                           css_list=css_list, )


@app.route("/css/view/<int:css_id>")
def get_post_css_command(css_id):
    conn = get_db_connection()
    css_view = conn.execute("SELECT * FROM css WHERE css_id = ?",
                            (css_id,)).fetchone()
    conn.close()
    return render_template("css/css_view_command.html",
                           css_view=css_view)


@app.route("/css/edit/<int:css_id>/", methods=("GET", "POST"))
def edit_css_command(css_id):
    conn = get_db_connection()
    edit_css_command_view = conn.execute("SELECT * FROM css WHERE css_id = ?",
                                         (css_id,)).fetchone()
    if request.method == "POST":
        css_command_edit = request.form["css_command"]
        css_name_edit = request.form["css_name"]
        # Поле description не обязательное, поэтому не будет делать условие
        css_description_edit = request.form["css_description"]
        if len(request.form['css_command']) > 4 and len(request.form['css_name']) > 10:
            conn = get_db_connection()
            conn.execute(
                "UPDATE css SET css_command = ?, css_name = ?, css_description = ? WHERE css_id = ?",
                (css_command_edit, css_name_edit, css_description_edit, css_id),
            )
            conn.commit()
            conn.close()
            if not css_command_edit:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='error')
            else:
                flash('Запись успешно сохранена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("css_list_commands"))
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("css/edit_css_command.html", edit_css_command_view=edit_css_command_view)


@app.route("/css/new_css_command", methods=["GET", "POST"])
def add_css_command():
    if request.method == "POST":
        new_css_command = request.form["css_command"]
        new_css_name = request.form["css_name"]
        # Поле description не обязательное, поэтому не будет делать условие
        new_css_description = request.form["css_description"]
        if len(request.form['css_command']) > 4 and len(request.form['css_name']) > 10:
            conn = get_db_connection()
            conn.execute(
                "INSERT INTO css (css_command, css_name, css_description) VALUES (?, ?, ?)",
                (new_css_command, new_css_name, new_css_description)
            )
            conn.commit()
            conn.close()
            if not new_css_command:
                flash('Ошибка сохранения записи!', category='error')
            else:
                flash('Запись успешно добавлена!')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("css_list_commands"))
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("css/add_css_command.html")


@app.route("/css/delete/<int:css_id>/", methods=("POST",))
def delete_css_command(css_id):
    conn = get_db_connection()
    conn.execute("DELETE FROM css WHERE css_id = ?",
                 (css_id,))
    conn.commit()
    conn.close()
    return redirect(url_for("css_list_commands"))


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
    links_list = conn.execute("SELECT * FROM links ORDER BY 1 DESC").fetchall()
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
