BEGIN TRANSACTION;
CREATE TABLE "bash" (
    bash_id INTEGER PRIMARY KEY AUTOINCREMENT,
    bash_command TEXT NOT NULL,
    bash_name TEXT NOT NULL
  , bash_description TEXT);
INSERT INTO "bash" VALUES(1,'CTRL + U','Удаление последней набранной строки.','Комбинация удаляет последнюю набранную пользователем команду.');
INSERT INTO "bash" VALUES(2,'CTRL + R','Поиск текста в истории',NULL);
INSERT INTO "bash" VALUES(3,'cp bash_and_git.txt ~/draft-project','Копирование файлов','Данная команда копирует файл bash_and_git.txt в папку корня draft-project.');
INSERT INTO "bash" VALUES(4,'clear','Очистка экрана','Команда очищает экран.');
INSERT INTO "bash" VALUES(5,'kill 666','Завершает процесс.','Команда завершает определенный запущенный процесс.');
INSERT INTO "bash" VALUES(6,'history','История команд.','Команда выводить всю историю команд bash.');
INSERT INTO "bash" VALUES(7,'ps','Выводит список процессов','Выводит весь список запущенных процессов.');
INSERT INTO "bash" VALUES(8,'pwd','Показывает текущий путь к папке','Показывает текущий путь к папке');
INSERT INTO "bash" VALUES(9,'cd ..','Возврат в вышестоящую директорию','Команда возвращает на каталог выше.');
INSERT INTO "bash" VALUES(10,'cd ../..','Возврат на две папки выше','Команда возвращает на 2 каталога выше.');
INSERT INTO "bash" VALUES(11,'cd ~','Переход в корневую папку.','Команда делает переход в корневую папку, в windows это папка пользователя системы.');
INSERT INTO "bash" VALUES(12,'ls','Вывод содержимого каталога(файлов и папок)','Вывод содержимого каталога(файлов и папок)');
INSERT INTO "bash" VALUES(13,'cd -','Вернуться назад','Команда возвращает в выше стоящюю директорию.');
INSERT INTO "bash" VALUES(14,'cd Users/','Переход  в оперделенную папку',NULL);
INSERT INTO "bash" VALUES(15,'ls -f','Показать файлы в данной папке, включая и скрытые',NULL);
INSERT INTO "bash" VALUES(16,'ls -d */','Вывод папок раздела',NULL);
INSERT INTO "bash" VALUES(17,'mkdir folder','Создание папки или папок(несколько папок через пробел нужно указать)',NULL);
INSERT INTO "bash" VALUES(18,'mv intro manual/chap1','Файл intro перенесется в папку manual под именем chap1',NULL);
INSERT INTO "bash" VALUES(19,'mv chap3 manual','Файл chap3 перенесется в папку manual',NULL);
INSERT INTO "bash" VALUES(20,'mv appendix apndx.a','Файл appendix переименуется в apndx.a',NULL);
INSERT INTO "bash" VALUES(21,'cat id_ed25519.pub','Чтение указанного файла',NULL);
INSERT INTO "bash" VALUES(22,'rm myfile','Удаление файла',NULL);
INSERT INTO "bash" VALUES(23,'rm -R GitHub/','Удаление папки с содержанием',NULL);
INSERT INTO "bash" VALUES(24,'rm -f -R GitHub/','Удаление папки с содержанием принудительно',NULL);
INSERT INTO "bash" VALUES(25,'exit','Выход из командной строки',NULL);
INSERT INTO "bash" VALUES(26,'nslookup test.ru','Запрос DNS определенного адреса',NULL);
INSERT INTO "bash" VALUES(27,'flask_project_lite_version/venv/scripts/python.exe flask_project_lite_version/app.py &','Запуск процесса в фоновом режиме',NULL);
INSERT INTO "bash" VALUES(28,'ssh-keygen','Генерация ssh-ключа',NULL);
INSERT INTO "bash" VALUES(29,'python -m venv venv','Создание виртуального окружения Python',NULL);
INSERT INTO "bash" VALUES(30,'touch bash.sh','Создание файла скрипта bash.sh',NULL);
INSERT INTO "bash" VALUES(31,'nano bash.sh','Открытие файла встроенным bash редактором',NULL);
INSERT INTO "bash" VALUES(32,'./bash.sh','Запуск скрипта bash',NULL);
INSERT INTO "bash" VALUES(33,'cmod +x bash.sh','Настройка прав на файл скрипта',NULL);
INSERT INTO "bash" VALUES(46,'ls -l','Выводит списокм папки и файлы текущего раздела с датой изменения, размером и правами доступа',NULL);
INSERT INTO "bash" VALUES(47,'rm *','Удаляет все файлы в ткущей директории',NULL);
INSERT INTO "bash" VALUES(48,'history -c','Удаляет все команды из истории',NULL);
INSERT INTO "bash" VALUES(50,'date','Вывод текущей даты и времени',NULL);
INSERT INTO "bash" VALUES(52,'mkdir test1 test2','Создаем две папки в текущем каталоге',NULL);
INSERT INTO "bash" VALUES(53,'rm -R *','Удаление всех папок текущей директории',NULL);
INSERT INTO "bash" VALUES(54,' ~/AppData/Local/Programs/Python/Python312/python.exe venv/Scripts/pip.exe install flask-paginate','Установки нужной библиотеки',NULL);
INSERT INTO "bash" VALUES(55,'cd /p/s.savin/flask-project-full/','Переход из текущего раздела в другой раздел с определенной папкой.',NULL);
INSERT INTO "bash" VALUES(56,'ls *.sh
','Выводит на экран все файлы с указанным расширением.',NULL);
INSERT INTO "bash" VALUES(69,'cd','Вернуться в корневую папку.','Команда возвращает пользователя в корневую папку.');
CREATE TABLE "css" (
    css_id INTEGER PRIMARY KEY AUTOINCREMENT,
    css_command TEXT NOT NULL,
    css_name TEXT NOT NULL
  , css_description TEXT);
CREATE TABLE git (
    git_id INTEGER PRIMARY KEY AUTOINCREMENT,
    git_command TEXT NOT NULL,
    git_name TEXT NOT NULL
  , git_description TEXT);
INSERT INTO "git" VALUES(1,'git config --global user.email "s.savin1@gitlab.plagate.ru"','Назначение git глобальной почты',NULL);
INSERT INTO "git" VALUES(2,'git config --global user.name "s.savin1"','Назначение git глобального имени',NULL);
INSERT INTO "git" VALUES(3,'git clone адрес ссылки','Клонирование удаленного репозитория.','Команда клонирует с удаленного репозитория проект.');
INSERT INTO "git" VALUES(4,'git status','Статус изменений.','Команда выводит статус всех изменений на данный момент.');
INSERT INTO "git" VALUES(5,'git config --list','Вывод конфигурации git',NULL);
INSERT INTO "git" VALUES(6,'git add .','Подготовка файлов для коммита.','Данная команда фиксирует все текущие изменения всех файлов, кроме тех, которые указаны в gitignore.');
INSERT INTO "git" VALUES(7,'git commit -m "test"','Подготовка коммита.','Команда создает коммит с указанием комментария.');
INSERT INTO "git" VALUES(8,'git push','Отправка изменений на репозиторий','Команда отправляет на сервер репозитория коммит.');
INSERT INTO "git" VALUES(9,'git init','Инициализация git в папке','Команда инициализирует текущую папку как репозиторий.');
INSERT INTO "git" VALUES(10,'git pull','Скачивание изменения из репозитория на локальную машину','Команда скачивает с репозитория последние измнения.');
CREATE TABLE healthy
(
    healthy_id      INTEGER
        primary key autoincrement,
    healthy_header TEXT not null,
    healthy_content TEXT not null
);
INSERT INTO "healthy" VALUES(1,'DDL','С опытом создания и клонирования таблиц, стало понятно, что лучше всего сделать генерацию DDL кода существующей таблицы.
Отредактировать запрос и запустить его.');
CREATE TABLE "html" (
    html_id INTEGER PRIMARY KEY AUTOINCREMENT,
    html_command TEXT NOT NULL,
    html_name TEXT NOT NULL
  , html_description TEXT);
CREATE TABLE "links"
(
    links_id      INTEGER
        primary key autoincrement,
    links_name    TEXT not null,
    links_command TEXT not null
, links_description TEXT);
INSERT INTO "links" VALUES(1,'Как сделать скрипт на bash','https://selectel.ru/blog/tutorials/linux-bash-scripting-guide/',NULL);
INSERT INTO "links" VALUES(2,'Как создать и запустить bat-файлы
','https://www.nic.ru/help/kak-sozdat6-i-zapustit6-bat-fajly_11640.html',NULL);
INSERT INTO "links" VALUES(3,'Работа с 7zip из командной строки','https://www.dmosk.ru/miniinstruktions.php?mini=7zip-cmd ',NULL);
INSERT INTO "links" VALUES(4,'Список команд Windows CMD  с описанием и примерами','https://ab57.ru/cmdlist.html',NULL);
INSERT INTO "links" VALUES(5,'Интересный материал про bash','https://linuxsimply.com/bash-scripting-tutorial/basics/',NULL);
INSERT INTO "links" VALUES(15,'Горячие клавиши Bash','https://selectel.ru/blog/tutorials/linux-terminal-hotkeys/',NULL);
INSERT INTO "links" VALUES(16,'Красивый python','https://sky.pro/media/pep8/',NULL);
INSERT INTO "links" VALUES(17,'Работа с gitignore','https://wiki.merionet.ru/articles/fajl-gitignore-kak-ignorirovat-fajly-i-papki-v-git',NULL);
INSERT INTO "links" VALUES(19,'Сайт с документацией по веб-технологиям.','https://developer.mozilla.org/ru/docs/Web','Сайт с документацией по веб-технологиям.');
INSERT INTO "links" VALUES(20,'Документация по Bootstrap.','https://getbootstrap.com/','Документация по Bootstrap.');
INSERT INTO "links" VALUES(21,'Описание библиотеки, которая позволяет работает с базой mysql.','https://pypi.org/project/PyMySQL/','Описание библиотеки, которая позволяет работает с базой mysql.');
CREATE TABLE "pandas"
(
    pandas_id      INTEGER
        primary key autoincrement,
    pandas_command TEXT not null,
    pandas_name    TEXT not null
, pandas_description TEXT);
INSERT INTO "pandas" VALUES(1,'data = pd.read_csv("data.csv")','Загрузка CSV-данных','Метод загружает csv файл с данными.');
INSERT INTO "pandas" VALUES(2,'df.to_csv("saved_ratings.csv", index=False))','Экспорт в формат CSV','Метод сохраняет в csv формате данные.');
INSERT INTO "pandas" VALUES(3,'data_copy = data.copy(deep=True)','Копирование датафрейма','Копирование датасета.');
INSERT INTO "pandas" VALUES(4,'len(data)','Подсчёт количества строк в датафрейме.','Подсчёт количества строк в датафрейме.');
INSERT INTO "pandas" VALUES(5,'len(data["user_id"].unique())','Подсчёт количества уникальных значений в столбце',NULL);
INSERT INTO "pandas" VALUES(6,'data.describe()','Вывод статистических сведений о датафрейме.','Вывод статистических сведений о датафрейме.');
INSERT INTO "pandas" VALUES(7,'data.type.value_counts()','Для того чтобы подсчитать количество значений в конкретном столбце, можно воспользоваться следующей конструкцие.',NULL);
INSERT INTO "pandas" VALUES(8,'data.columns.tolist()','Получение списка значений столбцов.','Получение списка значений столбцов.');
INSERT INTO "pandas" VALUES(9,'data["genre"].tolist()','Создание списка или объекта Series на основе значений столбца',NULL);
INSERT INTO "pandas" VALUES(10,'data["train set"] = True','Присоединение к датафрейму нового столбца с заданным значением',NULL);
INSERT INTO "pandas" VALUES(11,'data[["name","episodes"]]','Создание нового датафрейма из подмножества столбцов',NULL);
INSERT INTO "pandas" VALUES(12,'data.drop(["density"], axis="columns")','Удаление столбца',NULL);
INSERT INTO "pandas" VALUES(13,'data_modified.iloc[0:3]','Получение строк по числовым индексам',NULL);
INSERT INTO "pandas" VALUES(14,'data[data["type"].isin(["TV", "Movie"])]','Для получения строк датафрейма в ситуации, когда имеется список значений столбцов, можно воспользоваться следующей командой',NULL);
INSERT INTO "pandas" VALUES(15,'data[data["rating"] > 8]','Фильтрация по значению',NULL);
INSERT INTO "pandas" VALUES(16,'data.sort_values("rating", ascending=False)','Сортировка',NULL);
INSERT INTO "pandas" VALUES(17,'data.groupby("type").count()','Функция df.groupby и подсчёт количества записей',NULL);
INSERT INTO "pandas" VALUES(18,'data_modified.loc[["Haikyuu!! Second Season","Gintama"]]','Получение строк с нужными индексными значениями',NULL);
INSERT INTO "pandas" VALUES(19,'rating.merge(data, left_on=’data_id’, right_on=’data_id’, suffixes=(‘_left’, ‘_right’))','Слияние датафреймов',NULL);
INSERT INTO "pandas" VALUES(20,'data.info()','Получение сведений о датафрейм',NULL);
INSERT INTO "pandas" VALUES(21,'data.head()','Вывести первые пять строк датасета',NULL);
INSERT INTO "pandas" VALUES(22,'data.drop(["density","members"], axis="columns")','Удаление нескольких столбцов',NULL);
INSERT INTO "pandas" VALUES(23,'data = data.rename(columns={"Country Code": "country_code"})','Переименование столбца',NULL);
INSERT INTO "pandas" VALUES(24,'data.shape','Вывести количество строк и столбцов датасета',NULL);
INSERT INTO "pandas" VALUES(25,'data.max()','Получим максимальные значения в каждом столбце',NULL);
INSERT INTO "pandas" VALUES(26,'data_convert = data.astype("int16")','Изменение типа столбца',NULL);
INSERT INTO "pandas" VALUES(30,'df = pd.DataFrame(lst, columns=[c[0] for c in cur.description])','Создание датафрейма из базы данных','Команда позволяет создать датафрейм с данными из таблицы базы данных.');
CREATE TABLE [sql] ( 
  "sql_id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "sql_command" TEXT NOT NULL,
  "sql_name" TEXT NOT NULL
, sql_description TEXT);
INSERT INTO "sql" VALUES(1,'INSERT INTO  git_and_bash (command, name) VALUES (''test'', ''test'')','Добавление новой записи в таблицу',NULL);
INSERT INTO "sql" VALUES(2,'SELECT * FROM git_and_bash WHERE command LIKE ''%ls%'' ','Поиск в поле значений по части слова',NULL);
INSERT INTO "sql" VALUES(3,'SELECT * FROM links ORDER BY id DESC','Сортировка всех записей по убыванию',NULL);
INSERT INTO "sql" VALUES(4,'SELECT * FROM links ORDER BY id ASC','Сортировка по возрастанию',NULL);
INSERT INTO "sql" VALUES(5,'DELETE FROM git_and_bash WHERE id = 45','Удаление определенной записи',NULL);
INSERT INTO "sql" VALUES(6,'DELETE FROM [train];','Очистка таблицы',NULL);
INSERT INTO "sql" VALUES(7,'UPDATE [sql] SET [name]=''Сортировка всех записей по убыванию'' WHERE ([sql].[id] = 3);','Изменение значения записи определенного поля',NULL);
INSERT INTO "sql" VALUES(8,'ALTER TABLE [train] ADD [imya] VARCHAR(250) NOT NULL;','Добавление поля в таблицу',NULL);
INSERT INTO "sql" VALUES(9,'ALTER TABLE [train] RENAME COLUMN [train_name] TO [familia];','Переименование поля таблицы',NULL);
INSERT INTO "sql" VALUES(10,'DROP TABLE [train];','Удаляет таблицу базы данных',NULL);
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('bash',70);
INSERT INTO "sqlite_sequence" VALUES('sql',1158);
INSERT INTO "sqlite_sequence" VALUES('git',17);
INSERT INTO "sqlite_sequence" VALUES('pandas',30);
INSERT INTO "sqlite_sequence" VALUES('links',21);
INSERT INTO "sqlite_sequence" VALUES('css',1043);
INSERT INTO "sqlite_sequence" VALUES('html',2087);
INSERT INTO "sqlite_sequence" VALUES('healthy',247);
COMMIT;
