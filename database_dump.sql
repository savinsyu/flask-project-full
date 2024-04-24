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
INSERT INTO "git_and_bash" VALUES(9,'cd ..','������� � ����������� ����������');
INSERT INTO "git_and_bash" VALUES(10,'cd ../..','������� �� ��� ����� ����');
INSERT INTO "git_and_bash" VALUES(11,'cd ~','������� � �������� �������:');
INSERT INTO "git_and_bash" VALUES(12,'ls','����� ����������� ��������(������ � �����)');
INSERT INTO "git_and_bash" VALUES(13,'cd -','��������� �����');
INSERT INTO "git_and_bash" VALUES(14,'cd Users/','�������  � ������������ �����');
INSERT INTO "git_and_bash" VALUES(15,'ls -f','�������� ����� � ������ �����, ������� � �������');
INSERT INTO "git_and_bash" VALUES(16,'ls -d */','����� ����� �������');
INSERT INTO "git_and_bash" VALUES(17,'mkdir folder','�������� ����� ��� �����(��������� ����� ����� ������ ����� �������)');
INSERT INTO "git_and_bash" VALUES(18,'mv intro manual/chap1','���� intro ����������� � ����� manual ��� ������ chap1');
INSERT INTO "git_and_bash" VALUES(19,'mv chap3 manual','���� chap3 ����������� � ����� manual');
INSERT INTO "git_and_bash" VALUES(20,'mv appendix apndx.a','���� appendix ������������� � apndx.a');
INSERT INTO "git_and_bash" VALUES(21,'cat id_ed25519.pub','������ ���������� �����');
INSERT INTO "git_and_bash" VALUES(22,'rm myfile','�������� �����');
INSERT INTO "git_and_bash" VALUES(23,'rm -R GitHub/','�������� ����� � �����������');
INSERT INTO "git_and_bash" VALUES(24,'rm -f -R GitHub/','�������� ����� � ����������� �������������');
INSERT INTO "git_and_bash" VALUES(25,'exit','����� �� ��������� ������');
INSERT INTO "git_and_bash" VALUES(26,'nslookup agp-01.v0-app0180.plagate.ru','������ DNS ������������� ������');
INSERT INTO "git_and_bash" VALUES(27,'flask_project_lite_version/venv/scripts/python.exe flask_project_lite_version/app.py &','������ �������� � ������� ������');
INSERT INTO "git_and_bash" VALUES(28,'ssh-keygen','��������� ssh-�����');
INSERT INTO "git_and_bash" VALUES(29,'python -m venv venv','�������� ������������ ��������� Python');
INSERT INTO "git_and_bash" VALUES(30,'touch bash.sh','�������� ����� ������� bash.sh');
INSERT INTO "git_and_bash" VALUES(31,'nano bash.sh','�������� ����� ���������� bash ����������');
INSERT INTO "git_and_bash" VALUES(32,'./bash.sh','������ ������� bash');
INSERT INTO "git_and_bash" VALUES(33,'cmod +x bash.sh','��������� ���� �� ���� �������');
INSERT INTO "git_and_bash" VALUES(34,'git config --global user.email "s.savin1@gitlab.plagate.ru"','���������� git ���������� �����');
INSERT INTO "git_and_bash" VALUES(35,'git config --global user.name "s.savin1"','���������� git ����������� �����');
INSERT INTO "git_and_bash" VALUES(36,'git clone ssh://git@gitlab.plagate.ru:2224/apk-group/agp-group/agp.git','������������ ���������� �����������');
INSERT INTO "git_and_bash" VALUES(37,'git status','�������� ��������� �����������');
INSERT INTO "git_and_bash" VALUES(38,'git config --list','����� ������������ git');
INSERT INTO "git_and_bash" VALUES(39,'git add .','���������� ������ ��� �������');
INSERT INTO "git_and_bash" VALUES(40,'git commit -m "test"','��������� �������');
INSERT INTO "git_and_bash" VALUES(41,'git push','�������� ��������� �� �����������');
INSERT INTO "git_and_bash" VALUES(42,'git init','������������� git � �����');
INSERT INTO "git_and_bash" VALUES(43,'git pull','���������� ��������� �� ����������� �� ��������� ������');
INSERT INTO "git_and_bash" VALUES(46,'ls -l','������� ������� ����� � ����� �������� ������� � ����� ���������, �������� � ������� �������');
INSERT INTO "git_and_bash" VALUES(47,'rm *','������� ��� ����� � ������ ����������');
INSERT INTO "git_and_bash" VALUES(48,'history -c','������� ��� ������� �� �������');
CREATE TABLE links (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    link TEXT NOT NULL
  );
INSERT INTO "links" VALUES(1,'��� ������� ������ �� bash','https://selectel.ru/blog/tutorials/linux-bash-scripting-guide/');
INSERT INTO "links" VALUES(2,'��� ������� � ��������� bat-�����
','https://www.nic.ru/help/kak-sozdat6-i-zapustit6-bat-fajly_11640.html');
INSERT INTO "links" VALUES(3,'������ � 7zip �� ��������� ������','https://www.dmosk.ru/miniinstruktions.php?mini=7zip-cmd ');
INSERT INTO "links" VALUES(4,'������ ������ Windows CMD  � ��������� � ���������','https://ab57.ru/cmdlist.html');
CREATE TABLE "posts"
(
    id         INTEGER
        primary key autoincrement,
    title      TEXT not null,
    content    TEXT not null,
    image_post TEXT default 'no_image.png'
);
INSERT INTO "posts" VALUES(31,'��������� SQL-�������','�� ����������� ������������ ��������� SQL-�������.','sql_query_structure.jpg');
INSERT INTO "posts" VALUES(50,'SQL','SQL','SQL-help.jpg');
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('posts',52);
INSERT INTO "sqlite_sequence" VALUES('git_and_bash',48);
INSERT INTO "sqlite_sequence" VALUES('links',4);
COMMIT;
