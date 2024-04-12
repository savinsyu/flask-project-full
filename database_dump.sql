BEGIN TRANSACTION;
CREATE TABLE "posts"
(
    id         INTEGER
        primary key autoincrement,
    title      TEXT not null,
    content    TEXT not null,
    image_post TEXT default 'no_image.png'
);
INSERT INTO "posts" VALUES(31,'Структура SQL-запроса','На изображении отображается структура SQL-запроса.','sql_query_structure.jpg');
INSERT INTO "posts" VALUES(44,'BoxModel','BoxModel','BoxModel_Properties.png');
INSERT INTO "posts" VALUES(45,'FlexBox','FlexBox','FlexBox_Layout_Properties.png');
INSERT INTO "posts" VALUES(46,'Font Properties','Font Properties','Font_Properties.png');
INSERT INTO "posts" VALUES(47,'Grid','Grid','Grid_Layout_Properties.png');
INSERT INTO "posts" VALUES(48,'Shorthand Properties','Shorthand Properties','Shorthand_Properties.png');
INSERT INTO "posts" VALUES(49,'Shorthand Properties v3','Shorthand Properties v3','Shorthand_Properties_v3.png');
INSERT INTO "posts" VALUES(50,'SQL','SQL','SQL-help.jpg');
INSERT INTO "posts" VALUES(51,'Как сделать скрипт на bash','https://selectel.ru/blog/tutorials/linux-bash-scripting-guide/','no_image.png');
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('posts',52);
COMMIT;
