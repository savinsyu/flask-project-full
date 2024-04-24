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
INSERT INTO "git_and_bash" VALUES(26,'nslookup agp-01.v0-app0180.plagate.ru','Запрос DNS определенного адреса');
INSERT INTO "git_and_bash" VALUES(27,'flask_project_lite_version/venv/scripts/python.exe flask_project_lite_version/app.py &','Запуск процесса в фоновом режиме');
INSERT INTO "git_and_bash" VALUES(28,'ssh-keygen','Генерация ssh-ключа');
INSERT INTO "git_and_bash" VALUES(29,'python -m venv venv','Создание виртуального окружения Python');
INSERT INTO "git_and_bash" VALUES(30,'touch bash.sh','Создание файла скрипта bash.sh');
INSERT INTO "git_and_bash" VALUES(31,'nano bash.sh','Открытие файла встроенным bash редактором');
INSERT INTO "git_and_bash" VALUES(32,'./bash.sh','Запуск скрипта bash');
INSERT INTO "git_and_bash" VALUES(33,'cmod +x bash.sh','Настройка прав на файл скрипта');
INSERT INTO "git_and_bash" VALUES(34,'git config --global user.email "s.savin1@gitlab.plagate.ru"','Назначение git глобальной почты');
INSERT INTO "git_and_bash" VALUES(35,'git config --global user.name "s.savin1"','Назначение git глобального имени');
INSERT INTO "git_and_bash" VALUES(36,'git clone ssh://git@gitlab.plagate.ru:2224/apk-group/agp-group/agp.git','Клонирование удаленного репозитория');
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
CREATE TABLE "posts"
(
    id         INTEGER
        primary key autoincrement,
    title      TEXT not null,
    content    TEXT not null,
    image_post TEXT default 'no_image.png'
);
INSERT INTO "posts" VALUES(31,'Структура SQL-запроса','На изображении отображается структура SQL-запроса.','sql_query_structure.jpg');
INSERT INTO "posts" VALUES(50,'SQL','SQL','SQL-help.jpg');
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('posts',52);
INSERT INTO "sqlite_sequence" VALUES('git_and_bash',48);
INSERT INTO "sqlite_sequence" VALUES('links',4);
COMMIT;
