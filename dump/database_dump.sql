BEGIN TRANSACTION;
CREATE TABLE "bash" (

    bash_id INTEGER PRIMARY KEY AUTOINCREMENT,

    bash_command TEXT NOT NULL,

    bash_name TEXT NOT NULL

  );
INSERT INTO "bash" VALUES(1,'CTRL + U','�������� ��������� ��������� ������');
INSERT INTO "bash" VALUES(2,'CTRL + R','����� ������ � �������');
INSERT INTO "bash" VALUES(3,'cp bash_and_git.txt ~/draft-project','����������� ������');
INSERT INTO "bash" VALUES(4,'clear','������� ������');
INSERT INTO "bash" VALUES(5,'kill ����� ��������','��������� �������');
INSERT INTO "bash" VALUES(6,'history','���������� ������� ������');
INSERT INTO "bash" VALUES(7,'ps','������� ������ ���������');
INSERT INTO "bash" VALUES(8,'pwd','���������� ������� ���� � �����');
INSERT INTO "bash" VALUES(9,'cd ..','������� � ����������� ����������');
INSERT INTO "bash" VALUES(10,'cd ../..','������� �� ��� ����� ����');
INSERT INTO "bash" VALUES(11,'cd ~','������� � �������� �������:');
INSERT INTO "bash" VALUES(12,'ls','����� ����������� ��������(������ � �����)');
INSERT INTO "bash" VALUES(13,'cd -','��������� �����');
INSERT INTO "bash" VALUES(14,'cd Users/','�������  � ������������ �����');
INSERT INTO "bash" VALUES(15,'ls -f','�������� ����� � ������ �����, ������� � �������');
INSERT INTO "bash" VALUES(16,'ls -d */','����� ����� �������');
INSERT INTO "bash" VALUES(17,'mkdir folder','�������� ����� ��� �����(��������� ����� ����� ������ ����� �������)');
INSERT INTO "bash" VALUES(18,'mv intro manual/chap1','���� intro ����������� � ����� manual ��� ������ chap1');
INSERT INTO "bash" VALUES(19,'mv chap3 manual','���� chap3 ����������� � ����� manual');
INSERT INTO "bash" VALUES(20,'mv appendix apndx.a','���� appendix ������������� � apndx.a');
INSERT INTO "bash" VALUES(21,'cat id_ed25519.pub','������ ���������� �����');
INSERT INTO "bash" VALUES(22,'rm myfile','�������� �����');
INSERT INTO "bash" VALUES(23,'rm -R GitHub/','�������� ����� � �����������');
INSERT INTO "bash" VALUES(24,'rm -f -R GitHub/','�������� ����� � ����������� �������������');
INSERT INTO "bash" VALUES(25,'exit','����� �� ��������� ������');
INSERT INTO "bash" VALUES(26,'nslookup test.ru','������ DNS ������������� ������');
INSERT INTO "bash" VALUES(27,'flask_project_lite_version/venv/scripts/python.exe flask_project_lite_version/app.py &','������ �������� � ������� ������');
INSERT INTO "bash" VALUES(28,'ssh-keygen','��������� ssh-�����');
INSERT INTO "bash" VALUES(29,'python -m venv venv','�������� ������������ ��������� Python');
INSERT INTO "bash" VALUES(30,'touch bash.sh','�������� ����� ������� bash.sh');
INSERT INTO "bash" VALUES(31,'nano bash.sh','�������� ����� ���������� bash ����������');
INSERT INTO "bash" VALUES(32,'./bash.sh','������ ������� bash');
INSERT INTO "bash" VALUES(33,'cmod +x bash.sh','��������� ���� �� ���� �������');
INSERT INTO "bash" VALUES(46,'ls -l','������� ������� ����� � ����� �������� ������� � ����� ���������, �������� � ������� �������');
INSERT INTO "bash" VALUES(47,'rm *','������� ��� ����� � ������ ����������');
INSERT INTO "bash" VALUES(48,'history -c','������� ��� ������� �� �������');
INSERT INTO "bash" VALUES(50,'date','����� ������� ���� � �������');
INSERT INTO "bash" VALUES(52,'mkdir test1 test2','������� ��� ����� � ������� ��������');
INSERT INTO "bash" VALUES(53,'rm -R *','�������� ���� ����� ������� ����������');
INSERT INTO "bash" VALUES(54,' ~/AppData/Local/Programs/Python/Python312/python.exe venv/Scripts/pip.exe install flask-paginate','��������� ������ ����������');
INSERT INTO "bash" VALUES(55,'cd /p/s.savin/flask-project-full/','������� �� �������� ������� � ������ ������ � ������������ ������.');
INSERT INTO "bash" VALUES(56,'ls *.sh

','������� �� ����� ��� ����� � ��������� �����������.');
CREATE TABLE git (

    git_id INTEGER PRIMARY KEY AUTOINCREMENT,

    git_command TEXT NOT NULL,

    git_name TEXT NOT NULL

  );
INSERT INTO "git" VALUES(1,'git config --global user.email "s.savin1@gitlab.plagate.ru"','���������� git ���������� �����');
INSERT INTO "git" VALUES(2,'git config --global user.name "s.savin1"','���������� git ����������� �����');
INSERT INTO "git" VALUES(3,'git clone ����� ������','������������ ���������� �����������');
INSERT INTO "git" VALUES(4,'git status','�������� ��������� �����������');
INSERT INTO "git" VALUES(5,'git config --list','����� ������������ git');
INSERT INTO "git" VALUES(6,'git add .','���������� ������ ��� �������');
INSERT INTO "git" VALUES(7,'git commit -m "test"','��������� �������');
INSERT INTO "git" VALUES(8,'git push','�������� ��������� �� �����������');
INSERT INTO "git" VALUES(9,'git init','������������� git � �����');
INSERT INTO "git" VALUES(10,'git pull','���������� ��������� �� ����������� �� ��������� ������');
CREATE TABLE "links"
(
    links_id      INTEGER
        primary key autoincrement,
    links_name    TEXT not null,
    links_command TEXT not null
);
INSERT INTO "links" VALUES(1,'��� ������� ������ �� bash','https://selectel.ru/blog/tutorials/linux-bash-scripting-guide/');
INSERT INTO "links" VALUES(2,'��� ������� � ��������� bat-�����
','https://www.nic.ru/help/kak-sozdat6-i-zapustit6-bat-fajly_11640.html');
INSERT INTO "links" VALUES(3,'������ � 7zip �� ��������� ������','https://www.dmosk.ru/miniinstruktions.php?mini=7zip-cmd ');
INSERT INTO "links" VALUES(4,'������ ������ Windows CMD  � ��������� � ���������','https://ab57.ru/cmdlist.html');
INSERT INTO "links" VALUES(5,'���������� �������� ��� bash','https://linuxsimply.com/bash-scripting-tutorial/basics/');
INSERT INTO "links" VALUES(15,'������� ������� Bash','https://selectel.ru/blog/tutorials/linux-terminal-hotkeys/');
INSERT INTO "links" VALUES(16,'�������� python','https://sky.pro/media/pep8/');
INSERT INTO "links" VALUES(17,'������ � gitignore','https://wiki.merionet.ru/articles/fajl-gitignore-kak-ignorirovat-fajly-i-papki-v-git');
CREATE TABLE "pandas"
(
    pandas_id      INTEGER
        primary key autoincrement,
    pandas_command TEXT not null,
    pandas_name    TEXT not null
);
INSERT INTO "pandas" VALUES(1,'data = pd.read_csv("data.csv")','�������� CSV-������');
INSERT INTO "pandas" VALUES(2,'df.to_csv("saved_ratings.csv", index=False))','������� � ������ CSV');
INSERT INTO "pandas" VALUES(3,'data_copy = data.copy(deep=True)','����������� ����������');
INSERT INTO "pandas" VALUES(4,'len(data)','������� ���������� ����� � ����������');
INSERT INTO "pandas" VALUES(5,'len(data["user_id"].unique())','������� ���������� ���������� �������� � �������');
INSERT INTO "pandas" VALUES(6,'data.describe()','����� �������������� �������� � ����������');
INSERT INTO "pandas" VALUES(7,'data.type.value_counts()','��� ���� ����� ���������� ���������� �������� � ���������� �������, ����� ��������������� ��������� �����������.');
INSERT INTO "pandas" VALUES(8,'data.columns.tolist()','��������� ������ �������� ��������');
INSERT INTO "pandas" VALUES(9,'data["genre"].tolist()','�������� ������ ��� ������� Series �� ������ �������� �������');
INSERT INTO "pandas" VALUES(10,'data["train set"] = True','������������� � ���������� ������ ������� � �������� ���������');
INSERT INTO "pandas" VALUES(11,'data[["name","episodes"]]','�������� ������ ���������� �� ������������ ��������');
INSERT INTO "pandas" VALUES(12,'data.drop(["density"], axis="columns")','�������� �������');
INSERT INTO "pandas" VALUES(13,'data_modified.iloc[0:3]','��������� ����� �� �������� ��������');
INSERT INTO "pandas" VALUES(14,'data[data["type"].isin(["TV", "Movie"])]','��� ��������� ����� ���������� � ��������, ����� ������� ������ �������� ��������, ����� ��������������� ��������� ��������');
INSERT INTO "pandas" VALUES(15,'data[data["rating"] > 8]','���������� �� ��������');
INSERT INTO "pandas" VALUES(16,'data.sort_values("rating", ascending=False)','����������');
INSERT INTO "pandas" VALUES(17,'data.groupby("type").count()','������� df.groupby � ������� ���������� �������');
INSERT INTO "pandas" VALUES(18,'data_modified.loc[["Haikyuu!! Second Season","Gintama"]]','��������� ����� � ������� ���������� ����������');
INSERT INTO "pandas" VALUES(19,'rating.merge(data, left_on=�data_id�, right_on=�data_id�, suffixes=(�_left�, �_right�))','������� �����������');
INSERT INTO "pandas" VALUES(20,'data.info()','��������� �������� � ���������');
INSERT INTO "pandas" VALUES(21,'data.head()','������� ������ ���� ����� ��������');
INSERT INTO "pandas" VALUES(22,'data.drop(["density","members"], axis="columns")','�������� ���������� ��������');
INSERT INTO "pandas" VALUES(23,'data = data.rename(columns={"Country Code": "country_code"})','�������������� �������');
INSERT INTO "pandas" VALUES(24,'data.shape','������� ���������� ����� � �������� ��������');
INSERT INTO "pandas" VALUES(25,'data.max()','������� ������������ �������� � ������ �������');
INSERT INTO "pandas" VALUES(26,'data_convert = data.astype("int16")','��������� ���� �������');
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
CREATE TABLE [sql] ( 
  "sql_id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "sql_command" TEXT NOT NULL,
  "sql_name" TEXT NOT NULL
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
INSERT INTO "sql" VALUES(10,'DROP TABLE [train];','������� ������� ���� ������');
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('posts',56);
INSERT INTO "sqlite_sequence" VALUES('bash',56);
INSERT INTO "sqlite_sequence" VALUES('sql',11);
INSERT INTO "sqlite_sequence" VALUES('git',14);
INSERT INTO "sqlite_sequence" VALUES('pandas',27);
INSERT INTO "sqlite_sequence" VALUES('links',17);
COMMIT;
