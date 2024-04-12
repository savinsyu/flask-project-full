from datetime import datetime as dt
import os
from flask import Flask, render_template, request, redirect, url_for, flash, make_response
import sqlite3
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
    conn = get_db_connection()
    last_post = conn.execute("SELECT * FROM posts ORDER BY id DESC").fetchone()
    return render_template("index.html", last_post = last_post)


@app.route("/test")
def test():
    return render_template("test.html")


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
    app.run(debug=True, host='0.0.0.0', port=82)

print('App start!')
