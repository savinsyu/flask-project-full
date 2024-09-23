BEGIN TRANSACTION;
CREATE TABLE "bash" (
    bash_id INTEGER PRIMARY KEY AUTOINCREMENT,
    bash_command TEXT NOT NULL,
    bash_name TEXT NOT NULL
  , bash_description TEXT);
INSERT INTO "bash" VALUES(1,'CTRL + U','�������� ��������� ��������� ������.','���������� ������� ��������� ��������� ������������� �������.');
INSERT INTO "bash" VALUES(2,'CTRL + R','����� ������ � �������',NULL);
INSERT INTO "bash" VALUES(3,'cp bash_and_git.txt ~/draft-project','����������� ������','������ ������� �������� ���� bash_and_git.txt � ����� ����� draft-project.');
INSERT INTO "bash" VALUES(4,'clear','������� ������','������� ������� �����.');
INSERT INTO "bash" VALUES(5,'kill 666','��������� �������.','������� ��������� ������������ ���������� �������.');
INSERT INTO "bash" VALUES(6,'history','������� ������.','������� �������� ��� ������� ������ bash.');
INSERT INTO "bash" VALUES(7,'ps','������� ������ ���������','������� ���� ������ ���������� ���������.');
INSERT INTO "bash" VALUES(8,'pwd','���������� ������� ���� � �����','���������� ������� ���� � �����');
INSERT INTO "bash" VALUES(9,'cd ..','������� � ����������� ����������','������� ���������� �� ������� ����.');
INSERT INTO "bash" VALUES(10,'cd ../..','������� �� ��� ����� ����','������� ���������� �� 2 �������� ����.');
INSERT INTO "bash" VALUES(11,'cd ~','������� � �������� �����.','������� ������ ������� � �������� �����, � windows ��� ����� ������������ �������.');
INSERT INTO "bash" VALUES(12,'ls','����� ����������� ��������(������ � �����)','����� ����������� ��������(������ � �����)');
INSERT INTO "bash" VALUES(13,'cd -','��������� �����','������� ���������� � ���� ������� ����������.');
INSERT INTO "bash" VALUES(14,'cd Users/','�������  � ������������ �����',NULL);
INSERT INTO "bash" VALUES(15,'ls -f','�������� ����� � ������ �����, ������� � �������',NULL);
INSERT INTO "bash" VALUES(16,'ls -d */','����� ����� �������',NULL);
INSERT INTO "bash" VALUES(17,'mkdir folder','�������� ����� ��� �����(��������� ����� ����� ������ ����� �������)',NULL);
INSERT INTO "bash" VALUES(18,'mv intro manual/chap1','���� intro ����������� � ����� manual ��� ������ chap1',NULL);
INSERT INTO "bash" VALUES(19,'mv chap3 manual','���� chap3 ����������� � ����� manual',NULL);
INSERT INTO "bash" VALUES(20,'mv appendix apndx.a','���� appendix ������������� � apndx.a',NULL);
INSERT INTO "bash" VALUES(21,'cat id_ed25519.pub','������ ���������� �����',NULL);
INSERT INTO "bash" VALUES(22,'rm myfile','�������� �����',NULL);
INSERT INTO "bash" VALUES(23,'rm -R GitHub/','�������� ����� � �����������',NULL);
INSERT INTO "bash" VALUES(24,'rm -f -R GitHub/','�������� ����� � ����������� �������������',NULL);
INSERT INTO "bash" VALUES(25,'exit','����� �� ��������� ������',NULL);
INSERT INTO "bash" VALUES(26,'nslookup test.ru','������ DNS ������������� ������',NULL);
INSERT INTO "bash" VALUES(27,'flask_project_lite_version/venv/scripts/python.exe flask_project_lite_version/app.py &','������ �������� � ������� ������',NULL);
INSERT INTO "bash" VALUES(28,'ssh-keygen','��������� ssh-�����',NULL);
INSERT INTO "bash" VALUES(29,'python -m venv venv','�������� ������������ ��������� Python',NULL);
INSERT INTO "bash" VALUES(30,'touch bash.sh','�������� ����� ������� bash.sh',NULL);
INSERT INTO "bash" VALUES(31,'nano bash.sh','�������� ����� ���������� bash ����������',NULL);
INSERT INTO "bash" VALUES(32,'./bash.sh','������ ������� bash',NULL);
INSERT INTO "bash" VALUES(33,'cmod +x bash.sh','��������� ���� �� ���� �������',NULL);
INSERT INTO "bash" VALUES(46,'ls -l','������� ������� ����� � ����� �������� ������� � ����� ���������, �������� � ������� �������',NULL);
INSERT INTO "bash" VALUES(47,'rm *','������� ��� ����� � ������� ����������','None');
INSERT INTO "bash" VALUES(48,'history -c','������� ��� ������� �� �������',NULL);
INSERT INTO "bash" VALUES(50,'date','����� ������� ���� � �������',NULL);
INSERT INTO "bash" VALUES(52,'mkdir test1 test2','������� ��� ����� � ������� ��������',NULL);
INSERT INTO "bash" VALUES(53,'rm -R *','�������� ���� ����� ������� ����������',NULL);
INSERT INTO "bash" VALUES(54,'~/AppData/Local/Programs/Python/Python312/python.exe venv/Scripts/pip.exe install flask-paginate','��������� ������ ����������',NULL);
INSERT INTO "bash" VALUES(55,'cd /p/s.savin/flask-project-full/','������� �� �������� ������� � ������ ������ � ������������ ������.',NULL);
INSERT INTO "bash" VALUES(56,'ls *.sh','������� �� ����� ��� ����� � ��������� �����������.',NULL);
INSERT INTO "bash" VALUES(69,'cd','��������� � �������� �����.','������� ���������� ������������ � �������� �����.');
INSERT INTO "bash" VALUES(71,'cp -r ~/dbeaver-ce-24.0.4-win32.win32.x86_64/dbeaver/bases* /p/home/','����������� ���� ������ � ������ �����','��������� ������� ��������� ��� ����� ����� ����� � ������ �����.');
INSERT INTO "bash" VALUES(72,'ps | grep python','����� �������� �� �����','������� ��������� � ������ ������ ����� ��� �������� � ������ python');
INSERT INTO "bash" VALUES(73,'kill -9 $(ps | grep python)','��������� ������ ���� ���������� python','��������� ������ ���� ���������� python');
INSERT INTO "bash" VALUES(74,'Get-Process python','����� ���� ��������� Windows �� �����','������� PowerShell, ������� ������� ��� �������� Windows � ��������� python.');
INSERT INTO "bash" VALUES(75,'Stop-Process -Name "python" ','��������� ��������� �� �����','������� PowerShell, ������� ������������� ��� �������� Windows � ��������� python, ������ ������� kill � Bash.');
INSERT INTO "bash" VALUES(76,'Remove-Item -LiteralPath ''.\Polarity Portable\'' -Recurse','�������� ����� � ������� � PowerShell','������� ������� ����� � ������� � PowerSHell');
INSERT INTO "bash" VALUES(77,'~/AppData/Local/Programs/Python/Python312/python.exe venv/Scripts/pip.exe freeze > requirements.txt','�������� ����� � ��������','������� ������� ���� � ��������. ');
INSERT INTO "bash" VALUES(78,'~/AppData/Local/Programs/Python/Python312/python.exe venv/Scripts/pip.exe install -r requirements.txt','������������� �� ����� ��� ������','������������� �� ����� ��� ������.');
INSERT INTO "bash" VALUES(79,'mv ReferenceCard.pdf ../','����������� ����� �� ������� ����� � ����������� ������','����������� ����� �� ������� ����� � ����������� ������');
INSERT INTO "bash" VALUES(80,'mv *.sh virtual_machine_scripts/','����������� ���������� ������ � ������ ����� � ������������ �����������','����������� ���������� ������ � ������ ����� � ������������ �����������');
INSERT INTO "bash" VALUES(81,'p:/virtual_machine_scripts/start_apps.sh','������ bash ������� �� ����� ����������','������ bash ������� �� ����� ����������, ����������� ������ ���� � ������������ �����.');
INSERT INTO "bash" VALUES(82,'git config --global user.email "s.savin1@gitlab.plagate.ru"','���������� git ���������� �����',NULL);
INSERT INTO "bash" VALUES(83,'git config --global user.name "s.savin1"','���������� git ����������� �����',NULL);
INSERT INTO "bash" VALUES(84,'git clone ����� ������','������������ ���������� �����������.','������� ��������� � ���������� ����������� ������.');
INSERT INTO "bash" VALUES(85,'git status','������ ���������.','������� ������� ������ ���� ��������� �� ������ ������.');
INSERT INTO "bash" VALUES(86,'git config --list','����� ������������ git',NULL);
INSERT INTO "bash" VALUES(87,'git add .','���������� ������ ��� �������.','������ ������� ��������� ��� ������� ��������� ���� ������, ����� ���, ������� ������� � gitignore.');
INSERT INTO "bash" VALUES(88,'git commit -m "test"','���������� �������.','������� ������� ������ � ��������� �����������.');
INSERT INTO "bash" VALUES(89,'git push','�������� ��������� �� �����������','������� ���������� �� ������ ����������� ������.');
INSERT INTO "bash" VALUES(90,'git init','������������� git � �����','������� �������������� ������� ����� ��� �����������.');
INSERT INTO "bash" VALUES(91,'git pull','���������� ��������� �� ����������� �� ��������� ������','������� ��������� � ����������� ��������� ��������.');
CREATE TABLE "links"
(
    links_id      INTEGER
        primary key autoincrement,
    links_name    TEXT not null,
    links_command TEXT not null
, links_description TEXT);
INSERT INTO "links" VALUES(1,'��� ������� ������ �� bash','https://selectel.ru/blog/tutorials/linux-bash-scripting-guide/',NULL);
INSERT INTO "links" VALUES(2,'��� ������� � ��������� bat-�����
','https://www.nic.ru/help/kak-sozdat6-i-zapustit6-bat-fajly_11640.html',NULL);
INSERT INTO "links" VALUES(3,'������ � 7zip �� ��������� ������','https://www.dmosk.ru/miniinstruktions.php?mini=7zip-cmd ',NULL);
INSERT INTO "links" VALUES(4,'������ ������ Windows CMD  � ��������� � ���������','https://ab57.ru/cmdlist.html',NULL);
INSERT INTO "links" VALUES(5,'���������� �������� ��� bash','https://linuxsimply.com/bash-scripting-tutorial/basics/',NULL);
INSERT INTO "links" VALUES(15,'������� ������� Bash','https://selectel.ru/blog/tutorials/linux-terminal-hotkeys/',NULL);
INSERT INTO "links" VALUES(16,'�������� python','https://sky.pro/media/pep8/',NULL);
INSERT INTO "links" VALUES(17,'������ � gitignore','https://wiki.merionet.ru/articles/fajl-gitignore-kak-ignorirovat-fajly-i-papki-v-git',NULL);
INSERT INTO "links" VALUES(19,'���� � ������������� �� ���-�����������.','https://developer.mozilla.org/ru/docs/Web','���� � ������������� �� ���-�����������.');
INSERT INTO "links" VALUES(20,'������������ �� Bootstrap.','https://getbootstrap.com/','������������ �� Bootstrap.');
INSERT INTO "links" VALUES(21,'�������� ����������, ������� ��������� �������� � ����� mysql.','https://pypi.org/project/PyMySQL/','�������� ����������, ������� ��������� �������� � ����� mysql.');
INSERT INTO "links" VALUES(22,'������������ CLI PowerSHell','https://learn.microsoft.com/ru-ru/powershell/','������������ CLI PowerSHell');
CREATE TABLE "python" (
    "python_id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "python_command" TEXT NOT NULL,
    "python_name" TEXT NOT NULL
  , "python_description" TEXT);
INSERT INTO "python" VALUES(1,'print(type(count_person))','������� ��� ������','������� ��� ������');
INSERT INTO "python" VALUES(2,'df.to_csv("saved_ratings.csv", index=False))','������� � ������ CSV','����� ��������� � csv ������� ������.');
INSERT INTO "python" VALUES(3,'data_copy = data.copy(deep=True)','����������� ����������','����������� ��������.');
INSERT INTO "python" VALUES(4,'len(data)','������� ���������� ����� � ����������.','������� ���������� ����� � ����������.');
INSERT INTO "python" VALUES(5,'len(data["user_id"].unique())','������� ���������� ���������� �������� � �������',NULL);
INSERT INTO "python" VALUES(6,'data.describe()','����� �������������� �������� � ����������.','����� �������������� �������� � ����������.');
INSERT INTO "python" VALUES(7,'data.type.value_counts()','��� ���� ����� ���������� ���������� �������� � ���������� �������, ����� ��������������� ��������� �����������.',NULL);
INSERT INTO "python" VALUES(8,'data.columns.tolist()','��������� ������ �������� ��������.','��������� ������ �������� ��������.');
INSERT INTO "python" VALUES(9,'data["genre"].tolist()','�������� ������ ��� ������� Series �� ������ �������� �������',NULL);
INSERT INTO "python" VALUES(10,'data["train set"] = True','������������� � ���������� ������ ������� � �������� ���������',NULL);
INSERT INTO "python" VALUES(11,'data[["name","episodes"]]','�������� ������ ���������� �� ������������ ��������',NULL);
INSERT INTO "python" VALUES(12,'data.drop(["density"], axis="columns")','�������� �������',NULL);
INSERT INTO "python" VALUES(13,'data_modified.iloc[0:3]','��������� ����� �� �������� ��������',NULL);
INSERT INTO "python" VALUES(14,'data[data["type"].isin(["TV", "Movie"])]','��� ��������� ����� ���������� � ��������, ����� ������� ������ �������� ��������, ����� ��������������� ��������� ��������',NULL);
INSERT INTO "python" VALUES(15,'data[data["rating"] > 8]','���������� �� ��������',NULL);
INSERT INTO "python" VALUES(16,'data.sort_values("rating", ascending=False)','����������',NULL);
INSERT INTO "python" VALUES(17,'data.groupby("type").count()','������� df.groupby � ������� ���������� �������',NULL);
INSERT INTO "python" VALUES(18,'data_modified.loc[["Haikyuu!! Second Season","Gintama"]]','��������� ����� � ������� ���������� ����������',NULL);
INSERT INTO "python" VALUES(19,'rating.merge(data, left_on=�data_id�, right_on=�data_id�, suffixes=(�_left�, �_right�))','������� �����������',NULL);
INSERT INTO "python" VALUES(20,'data.info()','��������� �������� � ���������',NULL);
INSERT INTO "python" VALUES(21,'data.head()','������� ������ ���� ����� ��������',NULL);
INSERT INTO "python" VALUES(22,'data.drop(["density","members"], axis="columns")','�������� ���������� ��������',NULL);
INSERT INTO "python" VALUES(23,'data = data.rename(columns={"Country Code": "country_code"})','�������������� �������',NULL);
INSERT INTO "python" VALUES(24,'data.shape','������� ���������� ����� � �������� ��������',NULL);
INSERT INTO "python" VALUES(25,'data.max()','������� ������������ �������� � ������ �������',NULL);
INSERT INTO "python" VALUES(26,'data_convert = data.astype("int16")','��������� ���� �������',NULL);
INSERT INTO "python" VALUES(30,'df = pd.DataFrame(lst, columns=[c[0] for c in cur.description])','�������� ���������� �� ���� ������','������� ��������� ������� ��������� � ������� �� ������� ���� ������.');
INSERT INTO "python" VALUES(31,'df = pd.read_excel(''sotr.xlsx'', index_col=0)  ','�������� ������ �� EXCEL �����',NULL);
INSERT INTO "python" VALUES(32,'data = pd.read_csv("data.csv")','�������� CSV-������','����� ��������� csv ���� � �������.');
INSERT INTO "python" VALUES(2090,'�������� ���������','�������� ���������','�������� ���������1');
CREATE TABLE [sql] ( 
  "sql_id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "sql_command" TEXT NOT NULL,
  "sql_name" TEXT NOT NULL
, sql_description TEXT);
INSERT INTO "sql" VALUES(1,'INSERT INTO  git_and_bash (command, name) VALUES (''test'', ''test'')','���������� ����� ������ � �������',NULL);
INSERT INTO "sql" VALUES(2,'SELECT * FROM git_and_bash WHERE command LIKE ''%ls%'' ','����� � ���� �������� �� ����� �����',NULL);
INSERT INTO "sql" VALUES(3,'SELECT * FROM links ORDER BY id DESC','���������� ���� ������� �� ��������',NULL);
INSERT INTO "sql" VALUES(4,'SELECT * FROM links ORDER BY id ASC','���������� �� �����������',NULL);
INSERT INTO "sql" VALUES(5,'DELETE FROM git_and_bash WHERE id = 45','�������� ������������ ������',NULL);
INSERT INTO "sql" VALUES(6,'DELETE FROM [train];','������� �������',NULL);
INSERT INTO "sql" VALUES(7,'UPDATE [sql] SET [name]=''���������� ���� ������� �� ��������'' WHERE ([sql].[id] = 3);','��������� �������� ������ ������������� ����',NULL);
INSERT INTO "sql" VALUES(8,'ALTER TABLE [train] ADD [imya] VARCHAR(250) NOT NULL;','���������� ���� � �������',NULL);
INSERT INTO "sql" VALUES(9,'ALTER TABLE [train] RENAME COLUMN [train_name] TO [familia];','�������������� ���� �������',NULL);
INSERT INTO "sql" VALUES(10,'DROP TABLE [train];','������� ������� ���� ������',NULL);
INSERT INTO "sql" VALUES(1159,'SELECT DISTINCT field_299 FROM app_entity_25;','����� ���������� ��������','DISTINCT ���� � ������� ���������� �������� ���������� � ������� ������� ');
INSERT INTO "sql" VALUES(1161,'SELECT * FROM app_entity_30 ','����� ���� ������� �������','����� ���� ������� �������');
INSERT INTO "sql" VALUES(1162,'�������� ���������','�������� ���������','�������� ���������');
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('bash',91);
INSERT INTO "sqlite_sequence" VALUES('sql',1162);
INSERT INTO "sqlite_sequence" VALUES('links',23);
INSERT INTO "sqlite_sequence" VALUES('python',2090);
COMMIT;
