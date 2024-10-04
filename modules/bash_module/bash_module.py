from flask import Flask, render_template, request, redirect, url_for, flash
from modules import connect
from app import app

def bash_module():
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
