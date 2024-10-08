@app.route("/values")
def values():
    conn = connect.get_db_connection()
    values_list = conn.execute("SELECT * FROM values ORDER BY value_id DESC").fetchall()
    conn.close()

    return render_template("values/values_lists.html",
                           values_list=values_list,
                           )


@app.route("/values/view/<int:value_id>")
def get_post_value(value_id):
    conn = connect.get_db_connection()
    values_view = conn.execute("SELECT * FROM values WHERE value_id = ?",
                              (value_id,)).fetchone()
    conn.close()
    return render_template("values/values_view.html",
                           values_view=values_view)


@app.route("/values/edit/<int:value_id>/", methods=("GET", "POST"))
def edit_values(value_id):
    conn = connect.get_db_connection()
    edit_values_view = conn.execute("SELECT * FROM values WHERE value_id = ?",
                                           (value_id,)).fetchone()
    if request.method == "POST":
        values_edit = request.form["values"]
        values_name_edit = request.form["values_name"]
        # Поле description не обязательное, поэтому не будет делать условие
        values_description_edit = request.form["values_description"]
        if len(request.form['values']) > 4 and len(request.form['values_name']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "UPDATE values SET values = ?, values_name = ?, values_description = ? WHERE value_id = ?",
                (values_edit, values_name_edit, values_description_edit, value_id),
            )
            conn.commit()
            conn.close()
            if not values_edit:
                flash('Ошибка сохранения записи, вы ввели мало символов!', category='error')
            else:
                flash('Запись успешно сохранена!', category='success')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("values_lists"))
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("values/edit_values.html", edit_values_view=edit_values_view)


@app.route("/values/new_values", methods=["GET", "POST"])
def add_values():
    if request.method == "POST":
        new_values = request.form["values"]
        new_values_name = request.form["values_name"]
        # Поле description не обязательное, поэтому не будет делать условие
        new_values_description = request.form["values_description"]
        if len(request.form['values']) > 4 and len(request.form['values_name']) > 10:
            conn = connect.get_db_connection()
            conn.execute(
                "INSERT INTO values (values, values_name, values_description) VALUES (?, ?, ?)",
                (new_values, new_values_name, new_values_description)
            )
            conn.commit()
            conn.close()
            if not new_values:
                flash('Ошибка сохранения записи!', category='error')
            else:
                flash('Запись успешно добавлена!')
            # В случае соблюдения условий заполнения полей, произойдёт перенаправление
            return redirect(url_for("values_lists"))
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("values/add_values.html")


@app.route("/values/delete/<int:value_id>/", methods=("POST",))
def delete_values(value_id):
    conn = connect.get_db_connection()
    conn.execute("DELETE FROM values WHERE value_id = ?",
                 (value_id,))
    conn.commit()
    conn.close()
    return redirect(url_for("values_lists"))