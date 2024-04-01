from datetime import datetime as dt
import os
from flask import Flask, render_template, request, redirect, url_for, flash, make_response
import sqlite3
# from flask_bootstrap import Bootstrap5
from werkzeug.utils import secure_filename
from password_generator import generate_password
import requests


UPLOAD_FOLDER = 'images'
# RUS Прописываем какие расширения возможны для загрузки
# ENG Specify which extensions can be downloaded
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg'}

app = Flask(__name__)

app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
# RUS Прописываем ограничение размера картинки
# ENG We prescribe a limit on the size of the image
app.config['MAX_CONTENT_LENGTH'] = 1 * 1000 * 1000
# bootstrap = Bootstrap5()
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
    return render_template("index.html")


@app.route("/test")
def test():
    return render_template("test.html")


@app.route("/parsing")
def parsing():
    r = requests.get('https://api.github.com/events')
    requests
    print(requests)
    return render_template("parsing.html")


@app.route("/posts")
def posts():
    conn = get_db_connection()
    posts = conn.execute("SELECT * FROM posts").fetchall()
    conn.close()
    return render_template("posts/posts.html", posts=posts)


@app.route("/post/<int:post_id>")
def get_post(post_id):
    conn = get_db_connection()
    post = conn.execute("SELECT id, title, content, image_post FROM posts WHERE id = ?", (post_id,)).fetchone()
    conn.close()
    return render_template("posts/post.html", post=post)


@app.route("/<int:id>/edit_post", methods=("GET", "POST"))
def edit_post(id):
    if request.method == "POST":
        title_edit = request.form["title"]
        content_edit = request.form["content"]
        if len(request.form['title']) > 4 and len(request.form['content']) > 10:
            conn = get_db_connection()
            conn.execute(
                "UPDATE posts SET title = ?, content = ? WHERE id = ?",
                (title_edit, content_edit, id),
            )
            conn.commit()
            conn.close()
            if not title_edit:
                flash('Ошибка сохранения записи!', category='error')
            else:
                flash('Запись успешно сохранена!', category='success')
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("posts/edit_post.html")


@app.route("/<int:id>/delete", methods=("POST",))
def delete(id):
    conn = get_db_connection()
    conn.execute("DELETE FROM posts WHERE id = ?", (id,))
    conn.commit()
    conn.close()
    return redirect(url_for("posts"))


@app.route("/new", methods=["GET", "POST"])
def new_post():
    if request.method == "POST":
        title = request.form["title"]
        content = request.form["content"]
        if len(request.form['title']) > 4 and len(request.form['content']) > 10:
            conn = get_db_connection()
            conn.execute(
                "INSERT INTO posts (title, content) VALUES (?, ?)", (title, content)
            )
            conn.commit()
            conn.close()
            if not title:
                flash('Ошибка сохранения записи!', category='error')
            else:
                flash('Запись успешно добавлена!')

        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("posts/add_post.html")


@app.route("/tasks")
def tasks():
    conn = get_db_connection()
    tasks = conn.execute("SELECT * FROM tasks").fetchall()
    conn.close()
    return render_template("tasks/tasks.html", tasks=tasks)


@app.route("/tasks/<int:task_id>")
def get_task(task_id):
    conn = get_db_connection()
    task = conn.execute("SELECT * FROM tasks WHERE id_task = ?", (task_id,)).fetchone()
    conn.close()
    return render_template("tasks/task.html", task=task)


@app.route("/<int:id_task>/edit_task", methods=("GET", "POST"))
def edit_task(id_task):
    if request.method == "POST":
        title_task_edit = request.form["title_task"]
        task_content_edit = request.form["content"]
        if len(request.form['title_task']) > 4 and len(request.form['content']) > 10:
            conn = get_db_connection()
            conn.execute(
                "UPDATE tasks SET title_task = ?, content = ? WHERE id_task = ?",
                (title_task_edit, task_content_edit, id_task),
            )
            conn.commit()
            conn.close()
            if not title_task_edit:
                flash('Ошибка сохранения записи!', category='error')
            else:
                flash('Задача успешно сохранена!', category='success')
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("tasks/edit_task.html")


@app.route("/<int:id_task>/delete_task", methods=("POST",))
def delete_task(id_task):
    conn = get_db_connection()
    conn.execute("DELETE FROM tasks WHERE id_task = ?", (id_task,))
    conn.commit()
    conn.close()
    return redirect(url_for("tasks"))


@app.route("/new_task", methods=["GET", "POST"])
def new_task():
    if request.method == "POST":
        title = request.form["title_task"]
        content = request.form["content"]
        if len(request.form['title_task']) > 4 and len(request.form['content']) > 10:
            conn = get_db_connection()
            conn.execute(
                "INSERT INTO tasks (title_task, content) VALUES (?, ?)", (title, content)
            )
            conn.commit()
            conn.close()
            if not title:
                flash('Ошибка сохранения записи!', category='error')
            else:
                flash('Задача успешно добавлена!', category='success')
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("tasks/add_task.html")


@app.route("/releases")
def releases():
    conn = get_db_connection()
    releases = conn.execute("SELECT * FROM releases").fetchall()
    conn.close()
    return render_template("releases/releases.html", releases=releases)


@app.route("/release/<int:release_id>")
def get_release(release_id):
    conn = get_db_connection()
    release = conn.execute("SELECT * FROM releases WHERE id = ?", (release_id,)).fetchone()
    conn.close()
    return render_template("releases/release.html", release=release)


@app.route("/<int:id>/edit_release", methods=("GET", "POST"))
def edit_release(id):
    if request.method == "POST":
        edit_title_release = request.form["title"]
        edit_content_release = request.form["content"]
        if len(request.form['title']) > 4 and len(request.form['content']) > 10:
            conn = get_db_connection()
            conn.execute(
                "UPDATE releases SET title = ?, content = ? WHERE id = ?",
                (edit_title_release, edit_content_release, id),
            )
            conn.commit()
            conn.close()
            if not edit_title_release:
                flash('Ошибка сохранения записи!', category='error')
            else:
                flash('Релиз успешно сохранен!', category='success')
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("releases/edit_release.html")


@app.route("/<int:id>/delete_release", methods=("POST",))
def delete_release(id):
    conn = get_db_connection()
    conn.execute("DELETE FROM releases WHERE id= ?", (id,))
    conn.commit()
    conn.close()
    return redirect(url_for("releases"))


@app.route("/new_release", methods=["GET", "POST"])
def new_release():
    if request.method == "POST":
        title = request.form["title"]
        content = request.form["content"]
        if len(request.form['title']) > 4 and len(request.form['content']) > 10:
            conn = get_db_connection()
            conn.execute(
                "INSERT INTO releases (title, content) VALUES (?, ?)", (title, content)
            )
            conn.commit()
            conn.close()
            if not title:
                flash('Ошибка сохранения записи!', category='error')
            else:
                flash('Релиз успешно сохранен!', category='success')
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("releases/add_release.html")


@app.route("/sandboxes")
def sandboxes():
    conn = get_db_connection()
    sandboxes = conn.execute("SELECT * FROM sandbox").fetchall()
    sandboxes = conn.execute("SELECT * FROM sandbox LIMIT 5").fetchall()
    conn.close()
    return render_template("sandbox/sandboxes.html", sandboxes=sandboxes)


@app.route("/sandbox/<int:sandbox_id>")
def get_sandbox(sandbox_id):
    conn = get_db_connection()
    sandbox = conn.execute("SELECT * FROM sandbox WHERE id = ?", (sandbox_id,)).fetchone()
    conn.close()
    return render_template("sandbox/sandbox.html", sandbox=sandbox)


@app.route("/<int:id>/edit_sandbox", methods=("GET", "POST"))
def edit_sandbox(id, edit_title_sandbox):
    if request.method == "POST":
        edit_content_sandbox = request.form["content"]
        if len(request.form['content']) > 10:
            conn = get_db_connection()
            conn.execute(
                "UPDATE sandbox SET content = ? WHERE id = ?",
                (edit_content_sandbox, id),
            )
            conn.commit()
            conn.close()
            if not edit_title_sandbox:
                flash('Ошибка сохранения записи!', category='error')
            else:
                flash('Релиз успешно сохранен!', category='success')
        else:
            flash('Ошибка сохранения запииси!', category='error')

    return render_template("sandbox/edit_sandbox.html")


@app.route("/<int:id>/delete_sandbox", methods=("POST",))
def delete_sandbox(id):
    conn = get_db_connection()
    conn.execute("DELETE FROM sandbox WHERE id= ?", (id,))
    conn.commit()
    conn.close()
    return redirect(url_for("sandboxes"))


@app.route("/new_sandbox", methods=["GET", "POST"])
def new_sandbox():
    if request.method == "POST":
        content = request.form["content"]
        if len(request.form['content']) > 10:
            conn = get_db_connection()
            conn.execute(
                "INSERT INTO sandbox (content) VALUES (?)", (content,)
            )
            conn.commit()
            conn.close()
            if not content:
                flash('Ошибка сохранения записи!', category='error')
            else:
                flash('Запись успешно добавлена!', category='success')
        else:
            flash('Ошибка сохранения записи!', category='error')

    return render_template("sandbox/add_sandbox.html")


def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


@app.route('/upload_images')
def upload_images():
    return render_template("upload_images.html")


@app.route('/', methods=['POST'])
def upload_file():
    if request.method == 'POST':
        if 'file' not in request.files:
            flash('Не выбран файл')
            return redirect(request.url)
        file = request.files['file']
        if file.filename == '':
            flash('Не выбран файл картинки')
            return redirect(request.url)
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
            flash('Картинка успешно загружена')
            # RUS При успешной загрузке картинки возвращаемся на станицу загрузки картинки.
            # ENG If the image is successfully uploaded, we return to the image upload page.
            return redirect('/upload_images')
        else:
            flash('Разрешенными типами файлов являются png, jpg, jpeg')
            return redirect(request.url)


if __name__ == "__main__":
    app.run(debug=True)
