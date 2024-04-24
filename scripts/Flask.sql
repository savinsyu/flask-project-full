CREATE TABLE
  IF NOT EXISTS git_and_bash (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    command TEXT NOT NULL,
    name TEXT NOT NULL
  )
  
CREATE TABLE
  IF NOT EXISTS links (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    link TEXT NOT NULL
  )
  
INSERT INTO  git_and_bash (command, name) VALUES ('test', 'test')

INSERT INTO  git_and_bash (command, name) VALUES ('rm *', 'Удаляет все файлы в ткущей директории')

INSERT INTO  git_and_bash (command, name) VALUES ('history -c', 'Удаляет все команды из истории')

INSERT INTO  links (name, link) VALUES ('Работа с 7zip из командной строки', 'https://www.dmosk.ru/miniinstruktions.php?mini=7zip-cmd ')  

INSERT INTO  links (name, link) VALUES ('Список команд Windows CMD  с описанием и примерами', 'https://ab57.ru/cmdlist.html')  

SELECT * FROM git_and_bash gab ORDER BY 2 ASC 

SELECT * FROM git_and_bash WHERE command LIKE '%ls%' 

SELECT * FROM links l  ORDER BY id DESC

DELETE FROM git_and_bash WHERE id = 45


  

  
   
  


