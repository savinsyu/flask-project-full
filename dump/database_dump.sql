BEGIN TRANSACTION;
CREATE TABLE git_and_bash (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    command TEXT NOT NULL,
    name TEXT NOT NULL
  );
INSERT INTO "git_and_bash" VALUES(1,'CTRL + U','Удаление последней набранной строки');
INSERT INTO "git_and_bash" VALUES(2,'CTRL + R','Поиск текста в истории');
INSERT INTO "git_and_bash" VALUES(3,'cp bash_and_git.txt ~/draft-project','Копирование файлов');
INSERT INTO "git_and_bash" VALUES(4,'clear','Очистка экрана');
INSERT INTO "git_and_bash" VALUES(5,'kill номер процесса','Завершает процесс');
INSERT INTO "git_and_bash" VALUES(6,'history','Показывает историю команд');
INSERT INTO "git_and_bash" VALUES(7,'ps','Выводит список процессов');
INSERT INTO "git_and_bash" VALUES(8,'pwd','Показывает текущий путь к папке');
INSERT INTO "git_and_bash" VALUES(9,'cd ..','Возврат в вышестоящую директорию');
INSERT INTO "git_and_bash" VALUES(10,'cd ../..','Возврат на две папки выше');
INSERT INTO "git_and_bash" VALUES(11,'cd ~','Переход в корневой каталог:');
INSERT INTO "git_and_bash" VALUES(12,'ls','Вывод содержимого каталога(файлов и папок)');
INSERT INTO "git_and_bash" VALUES(13,'cd -','Вернуться назад');
INSERT INTO "git_and_bash" VALUES(14,'cd Users/','Переход  в оперделенную папку');
INSERT INTO "git_and_bash" VALUES(15,'ls -f','Показать файлы в данной папке, включая и скрытые');
INSERT INTO "git_and_bash" VALUES(16,'ls -d */','Вывод папок раздела');
INSERT INTO "git_and_bash" VALUES(17,'mkdir folder','Создание папки или папок(несколько папок через пробел нужно указать)');
INSERT INTO "git_and_bash" VALUES(18,'mv intro manual/chap1','Файл intro перенесется в папку manual под именем chap1');
INSERT INTO "git_and_bash" VALUES(19,'mv chap3 manual','Файл chap3 перенесется в папку manual');
INSERT INTO "git_and_bash" VALUES(20,'mv appendix apndx.a','Файл appendix переименуется в apndx.a');
INSERT INTO "git_and_bash" VALUES(21,'cat id_ed25519.pub','Чтение указанного файла');
INSERT INTO "git_and_bash" VALUES(22,'rm myfile','Удаление файла');
INSERT INTO "git_and_bash" VALUES(23,'rm -R GitHub/','Удаление папки с содержанием');
INSERT INTO "git_and_bash" VALUES(24,'rm -f -R GitHub/','Удаление папки с содержанием принудительно');
INSERT INTO "git_and_bash" VALUES(25,'exit','Выход из командной строки');
INSERT INTO "git_and_bash" VALUES(26,'nslookup test.ru','Запрос DNS определенного адреса');
INSERT INTO "git_and_bash" VALUES(27,'flask_project_lite_version/venv/scripts/python.exe flask_project_lite_version/app.py &','Запуск процесса в фоновом режиме');
INSERT INTO "git_and_bash" VALUES(28,'ssh-keygen','Генерация ssh-ключа');
INSERT INTO "git_and_bash" VALUES(29,'python -m venv venv','Создание виртуального окружения Python');
INSERT INTO "git_and_bash" VALUES(30,'touch bash.sh','Создание файла скрипта bash.sh');
INSERT INTO "git_and_bash" VALUES(31,'nano bash.sh','Открытие файла встроенным bash редактором');
INSERT INTO "git_and_bash" VALUES(32,'./bash.sh','Запуск скрипта bash');
INSERT INTO "git_and_bash" VALUES(33,'cmod +x bash.sh','Настройка прав на файл скрипта');
INSERT INTO "git_and_bash" VALUES(34,'git config --global user.email "s.savin1@gitlab.plagate.ru"','Назначение git глобальной почты');
INSERT INTO "git_and_bash" VALUES(35,'git config --global user.name "s.savin1"','Назначение git глобального имени');
INSERT INTO "git_and_bash" VALUES(36,'git clone адрес ссылки','Клонирование удаленного репозитория');
INSERT INTO "git_and_bash" VALUES(37,'git status','Проверка изменений репозитория');
INSERT INTO "git_and_bash" VALUES(38,'git config --list','Вывод конфигурации git');
INSERT INTO "git_and_bash" VALUES(39,'git add .','Подготовка файлов для коммита');
INSERT INTO "git_and_bash" VALUES(40,'git commit -m "test"','Написание коммита');
INSERT INTO "git_and_bash" VALUES(41,'git push','Отправка изменений на репозиторий');
INSERT INTO "git_and_bash" VALUES(42,'git init','Инициализация git в папке');
INSERT INTO "git_and_bash" VALUES(43,'git pull','Скачивание изменения из репозитория на локальную машину');
INSERT INTO "git_and_bash" VALUES(46,'ls -l','Выводит списокм папки и файлы текущего раздела с датой изменения, размером и правами доступа');
INSERT INTO "git_and_bash" VALUES(47,'rm *','Удаляет все файлы в ткущей директории');
INSERT INTO "git_and_bash" VALUES(48,'history -c','Удаляет все команды из истории');
INSERT INTO "git_and_bash" VALUES(50,'date','Вывод текущей даты и времени');
INSERT INTO "git_and_bash" VALUES(52,'mkdir test1 test2','Создаем две папки в текущем каталоге');
INSERT INTO "git_and_bash" VALUES(53,'rm -R *','Удаление всех папок текущей директории');
CREATE TABLE links (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    link TEXT NOT NULL
  );
INSERT INTO "links" VALUES(1,'Как сделать скрипт на bash','https://selectel.ru/blog/tutorials/linux-bash-scripting-guide/');
INSERT INTO "links" VALUES(2,'Как создать и запустить bat-файлы
','https://www.nic.ru/help/kak-sozdat6-i-zapustit6-bat-fajly_11640.html');
INSERT INTO "links" VALUES(3,'Работа с 7zip из командной строки','https://www.dmosk.ru/miniinstruktions.php?mini=7zip-cmd ');
INSERT INTO "links" VALUES(4,'Список команд Windows CMD  с описанием и примерами','https://ab57.ru/cmdlist.html');
INSERT INTO "links" VALUES(5,'Интересный материал про bash','https://linuxsimply.com/bash-scripting-tutorial/basics/');
INSERT INTO "links" VALUES(15,'Горячие клавиши Bash','https://selectel.ru/blog/tutorials/linux-terminal-hotkeys/');
CREATE TABLE pandas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    command TEXT NOT NULL,
    name TEXT NOT NULL
  );
INSERT INTO "pandas" VALUES(1,'data = pd.read_csv("data.csv")','Загрузка CSV-данных');
INSERT INTO "pandas" VALUES(2,'df.to_csv("saved_ratings.csv", index=False))','Экспорт в формат CSV');
INSERT INTO "pandas" VALUES(3,'data_copy = data.copy(deep=True)','Копирование датафрейма');
INSERT INTO "pandas" VALUES(4,'len(data)','Подсчёт количества строк в датафрейме');
INSERT INTO "pandas" VALUES(5,'len(data["user_id"].unique())','Подсчёт количества уникальных значений в столбце');
INSERT INTO "pandas" VALUES(6,'data.describe()','Вывод статистических сведений о датафрейме');
INSERT INTO "pandas" VALUES(7,'data.type.value_counts()','Для того чтобы подсчитать количество значений в конкретном столбце, можно воспользоваться следующей конструкцие.');
INSERT INTO "pandas" VALUES(8,'data.columns.tolist()','Получение списка значений столбцов');
INSERT INTO "pandas" VALUES(9,'data["genre"].tolist()','Создание списка или объекта Series на основе значений столбца');
INSERT INTO "pandas" VALUES(10,'data["train set"] = True','Присоединение к датафрейму нового столбца с заданным значением');
INSERT INTO "pandas" VALUES(11,'data[["name","episodes"]]','Создание нового датафрейма из подмножества столбцов');
INSERT INTO "pandas" VALUES(12,'data.drop(["density"], axis="columns")','Удаление столбца');
INSERT INTO "pandas" VALUES(13,'data_modified.iloc[0:3]','Получение строк по числовым индексам');
INSERT INTO "pandas" VALUES(14,'data[data["type"].isin(["TV", "Movie"])]','Для получения строк датафрейма в ситуации, когда имеется список значений столбцов, можно воспользоваться следующей командой');
INSERT INTO "pandas" VALUES(15,'data[data["rating"] > 8]','Фильтрация по значению');
INSERT INTO "pandas" VALUES(16,'data.sort_values("rating", ascending=False)','Сортировка');
INSERT INTO "pandas" VALUES(17,'data.groupby("type").count()','Функция df.groupby и подсчёт количества записей');
INSERT INTO "pandas" VALUES(18,'data_modified.loc[["Haikyuu!! Second Season","Gintama"]]','Получение строк с нужными индексными значениями');
INSERT INTO "pandas" VALUES(19,'rating.merge(data, left_on=’data_id’, right_on=’data_id’, suffixes=(‘_left’, ‘_right’))','Слияние датафреймов');
INSERT INTO "pandas" VALUES(20,'data.info()','Получение сведений о датафрейм');
INSERT INTO "pandas" VALUES(21,'data.head()','Вывести первые пять строк датасета');
INSERT INTO "pandas" VALUES(22,'data.drop(["density","members"], axis="columns")','Удаление нескольких столбцов');
INSERT INTO "pandas" VALUES(23,'data = data.rename(columns={"Country Code": "country_code"})','Переименование столбца');
INSERT INTO "pandas" VALUES(24,'data.shape','Вывести количество строк и столбцов датасета');
CREATE TABLE "posts"
(
    id         INTEGER
        primary key autoincrement,
    title      TEXT not null,
    content    TEXT not null,
    image_post TEXT default 'no_image.png'
);
INSERT INTO "posts" VALUES(31,'Структура SQL-запроса','На картинке изображена структура SQL-запроса.','sql_query_structure.jpg');
INSERT INTO "posts" VALUES(50,'Шпаргалка по SQL.','Шпаргалка по SQL.','SQL-help.jpg');
INSERT INTO "posts" VALUES(53,'Как сделать темную тему в Windows 10?','В поле "Поиск" вводим слово "Тема".
Нажимаем "Выбор главного цвета" и выбираем в раскрывающемся поле пункт "Тёмный".','no_image.png');
CREATE TABLE [sql] ( 
  [id] INTEGER PRIMARY KEY AUTOINCREMENT,
  [command] TEXT NOT NULL,
  [name] TEXT NOT NULL
);
INSERT INTO "sql" VALUES(1,'INSERT INTO  git_and_bash (command, name) VALUES (''test'', ''test'')','Добавление новой записи в таблицу');
INSERT INTO "sql" VALUES(2,'SELECT * FROM git_and_bash WHERE command LIKE ''%ls%'' ','Поиск в поле значений по части слова');
INSERT INTO "sql" VALUES(3,'SELECT * FROM links ORDER BY id DESC','Сортировка всех записей по убыванию');
INSERT INTO "sql" VALUES(4,'SELECT * FROM links ORDER BY id ASC','Сортировка по возрастанию');
INSERT INTO "sql" VALUES(5,'DELETE FROM git_and_bash WHERE id = 45','Удаление определенной записи');
INSERT INTO "sql" VALUES(6,'DELETE FROM [train];','Очистка таблицы');
INSERT INTO "sql" VALUES(7,'UPDATE [sql] SET [name]=''Сортировка всех записей по убыванию'' WHERE ([sql].[id] = 3);','Изменение значения записи определенного поля');
INSERT INTO "sql" VALUES(8,'ALTER TABLE [train] ADD [imya] VARCHAR(250) NOT NULL;','Добавление поля в таблицу');
INSERT INTO "sql" VALUES(9,'ALTER TABLE [train] RENAME COLUMN [train_name] TO [familia];','Переименование поля таблицы');
INSERT INTO "sql" VALUES(10,'DROP TABLE [train];','Удаляет таблицу базы данных');
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('posts',54);
INSERT INTO "sqlite_sequence" VALUES('git_and_bash',53);
INSERT INTO "sqlite_sequence" VALUES('links',15);
INSERT INTO "sqlite_sequence" VALUES('sql',10);
INSERT INTO "sqlite_sequence" VALUES('pandas',24);
COMMIT;
