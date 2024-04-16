BEGIN TRANSACTION;
CREATE TABLE git_and_bash (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    command TEXT NOT NULL,
    name TEXT NOT NULL
  );
INSERT INTO "git_and_bash" VALUES(1,'CTRL + U','�������� ��������� ��������� ������');
INSERT INTO "git_and_bash" VALUES(2,'CTRL + R','����� ������ � �������');
INSERT INTO "git_and_bash" VALUES(3,'cp bash_and_git.txt ~/draft-project','����������� ������');
INSERT INTO "git_and_bash" VALUES(4,'clear','������� ������');
INSERT INTO "git_and_bash" VALUES(5,'kill ����� ��������','��������� �������');
INSERT INTO "git_and_bash" VALUES(6,'history','���������� ������� ������');
INSERT INTO "git_and_bash" VALUES(7,'ps','������� ������ ���������');
INSERT INTO "git_and_bash" VALUES(8,'pwd','���������� ������� ���� � �����');
CREATE TABLE "posts"
(
    id         INTEGER
        primary key autoincrement,
    title      TEXT not null,
    content    TEXT not null,
    image_post TEXT default 'no_image.png'
);
INSERT INTO "posts" VALUES(31,'��������� SQL-�������','�� ����������� ������������ ��������� SQL-�������.','sql_query_structure.jpg');
INSERT INTO "posts" VALUES(44,'BoxModel','BoxModel','BoxModel_Properties.png');
INSERT INTO "posts" VALUES(45,'FlexBox','FlexBox','FlexBox_Layout_Properties.png');
INSERT INTO "posts" VALUES(46,'Font Properties','Font Properties','Font_Properties.png');
INSERT INTO "posts" VALUES(47,'Grid','Grid','Grid_Layout_Properties.png');
INSERT INTO "posts" VALUES(48,'Shorthand Properties','Shorthand Properties','Shorthand_Properties.png');
INSERT INTO "posts" VALUES(49,'Shorthand Properties v3','Shorthand Properties v3','Shorthand_Properties_v3.png');
INSERT INTO "posts" VALUES(50,'SQL','SQL','SQL-help.jpg');
INSERT INTO "posts" VALUES(51,'��� ������� ������ �� bash','https://selectel.ru/blog/tutorials/linux-bash-scripting-guide/','no_image.png');
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('posts',52);
INSERT INTO "sqlite_sequence" VALUES('git_and_bash',8);
COMMIT;
