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
INSERT INTO "git_and_bash" VALUES(26,'nslookup test.ru','������ DNS ������������� ������');
INSERT INTO "git_and_bash" VALUES(27,'flask_project_lite_version/venv/scripts/python.exe flask_project_lite_version/app.py &','������ �������� � ������� ������');
INSERT INTO "git_and_bash" VALUES(28,'ssh-keygen','��������� ssh-�����');
INSERT INTO "git_and_bash" VALUES(29,'python -m venv venv','�������� ������������ ��������� Python');
INSERT INTO "git_and_bash" VALUES(30,'touch bash.sh','�������� ����� ������� bash.sh');
INSERT INTO "git_and_bash" VALUES(31,'nano bash.sh','�������� ����� ���������� bash ����������');
INSERT INTO "git_and_bash" VALUES(32,'./bash.sh','������ ������� bash');
INSERT INTO "git_and_bash" VALUES(33,'cmod +x bash.sh','��������� ���� �� ���� �������');
INSERT INTO "git_and_bash" VALUES(34,'git config --global user.email "s.savin1@gitlab.plagate.ru"','���������� git ���������� �����');
INSERT INTO "git_and_bash" VALUES(35,'git config --global user.name "s.savin1"','���������� git ����������� �����');
INSERT INTO "git_and_bash" VALUES(36,'git clone ����� ������','������������ ���������� �����������');
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
INSERT INTO "git_and_bash" VALUES(50,'date','����� ������� ���� � �������');
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
CREATE TABLE pandas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    command TEXT NOT NULL,
    name TEXT NOT NULL
  );
INSERT INTO "pandas" VALUES(1,'anime = pd.read_csv("anime-recommendations-database/anime.csv")','�������� CSV-������');
INSERT INTO "pandas" VALUES(2,'df.to_csv("saved_ratings.csv", index=False))','������� � ������ CSV');
INSERT INTO "pandas" VALUES(3,'anime_copy = anime.copy(deep=True)','����������� ����������');
INSERT INTO "pandas" VALUES(4,'len(df)','������� ���������� ����� � ����������');
INSERT INTO "pandas" VALUES(5,'len(ratings["user_id"].unique())','������� ���������� ���������� �������� � �������');
INSERT INTO "pandas" VALUES(6,'anime.describe()','����� �������������� �������� � ����������');
INSERT INTO "pandas" VALUES(7,'anime.type.value_counts()','��� ���� ����� ���������� ���������� �������� � ���������� �������, ����� ��������������� ��������� �����������.');
INSERT INTO "pandas" VALUES(8,'anime.columns.tolist()','��������� ������ �������� ��������');
INSERT INTO "pandas" VALUES(9,'anime["genre"].tolist()','�������� ������ ��� ������� Series �� ������ �������� �������');
INSERT INTO "pandas" VALUES(10,'anime["train set"] = True','������������� � ���������� ������ ������� � �������� ���������');
INSERT INTO "pandas" VALUES(11,'anime[["name","episodes"]]','�������� ������ ���������� �� ������������ ��������');
INSERT INTO "pandas" VALUES(12,'anime.drop(["anime_id", "genre", "members"], axis=1).head()','�������� �������� ��������');
INSERT INTO "pandas" VALUES(13,'anime_modified.iloc[0:3]','��������� ����� �� �������� ��������');
INSERT INTO "pandas" VALUES(14,'anime[anime["type"].isin(["TV", "Movie"])]','��� ��������� ����� ���������� � ��������, ����� ������� ������ �������� ��������, ����� ��������������� ��������� ��������');
INSERT INTO "pandas" VALUES(15,'anime[anime["rating"] > 8]','���������� �� ��������');
INSERT INTO "pandas" VALUES(16,'anime.sort_values("rating", ascending=False)','����������');
INSERT INTO "pandas" VALUES(17,'anime.groupby("type").count()','������� df.groupby � ������� ���������� �������');
INSERT INTO "pandas" VALUES(18,'anime_modified.loc[["Haikyuu!! Second Season","Gintama"]]','��������� ����� � ������� ���������� ����������');
INSERT INTO "pandas" VALUES(19,'rating.merge(anime, left_on=�anime_id�, right_on=�anime_id�, suffixes=(�_left�, �_right�))','������� �����������');
INSERT INTO "pandas" VALUES(20,'anime.info()','��������� �������� � ���������');
CREATE TABLE "posts"
(
    id         INTEGER
        primary key autoincrement,
    title      TEXT not null,
    content    TEXT not null,
    image_post TEXT default 'no_image.png'
);
INSERT INTO "posts" VALUES(31,'��������� SQL-�������','�� �������� ���������� ��������� SQL-�������.','sql_query_structure.jpg');
INSERT INTO "posts" VALUES(50,'��������� �� SQL.','��������� �� SQL.','SQL-help.jpg');
INSERT INTO "posts" VALUES(53,'��� ������� ������ ���� � Windows 10?','� ���� "�����" ������ ����� "����".
�������� "����� �������� �����" � �������� � �������������� ���� ����� "Ҹ����".','no_image.png');
INSERT INTO "posts" VALUES(54,'�������� ������ ','�������� ������ ','no_image.png');
CREATE TABLE [sql] ( 
  [id] INTEGER PRIMARY KEY AUTOINCREMENT,
  [command] TEXT NOT NULL,
  [name] TEXT NOT NULL
);
INSERT INTO "sql" VALUES(1,'INSERT INTO  git_and_bash (command, name) VALUES (''test'', ''test'')','���������� ����� ������ � �������');
INSERT INTO "sql" VALUES(2,'SELECT * FROM git_and_bash WHERE command LIKE ''%ls%'' ','����� � ���� �������� �� ����� �����');
INSERT INTO "sql" VALUES(3,'SELECT * FROM links ORDER BY id DESC','���������� ���� ������� �� ��������');
INSERT INTO "sql" VALUES(4,'SELECT * FROM links ORDER BY id ASC','���������� �� �����������');
INSERT INTO "sql" VALUES(5,'DELETE FROM git_and_bash WHERE id = 45','�������� ������������ ������');
INSERT INTO "sql" VALUES(6,'DELETE FROM [train];','������� �������');
INSERT INTO "sql" VALUES(7,'UPDATE [sql] SET [name]=''���������� ���� ������� �� ��������'' WHERE ([sql].[id] = 3);','��������� �������� ������ ������������� ����');
INSERT INTO "sql" VALUES(8,'ALTER TABLE [train] ADD [imya] VARCHAR(250) NOT NULL;','���������� ���� � �������');
INSERT INTO "sql" VALUES(9,'ALTER TABLE [train] RENAME COLUMN [train_name] TO [familia];','�������������� ���� �������');
CREATE TABLE [train] ( 
  [id] INTEGER PRIMARY KEY AUTOINCREMENT,
  [familia] TEXT NOT NULL,
  [imya] VARCHAR(250) NOT NULL,
  [otchestvo] VARCHAR(250) NOT NULL,
  [age] INT NOT NULL
);
INSERT INTO "train" VALUES(1,'������','����','��������',50);
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('posts',54);
INSERT INTO "sqlite_sequence" VALUES('git_and_bash',51);
INSERT INTO "sqlite_sequence" VALUES('links',4);
INSERT INTO "sqlite_sequence" VALUES('sql',9);
INSERT INTO "sqlite_sequence" VALUES('train',1);
INSERT INTO "sqlite_sequence" VALUES('pandas',20);
COMMIT;
