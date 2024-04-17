CREATE TABLE
  IF NOT EXISTS git_and_bash (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    command TEXT NOT NULL,
    name TEXT NOT NULL
  )
  
INSERT INTO  git_and_bash (command, name) VALUES ('test', 'test')

SELECT * FROM git_and_bash gab ORDER BY id DESC 

SELECT * FROM git_and_bash WHERE command LIKE '%ls%' 

INSERT INTO  git_and_bash (command, name) VALUES ('ls -l', 'Выводит списокм папки и файлы текущего раздела с датой изменения, размером и правами доступа')

DELETE FROM git_and_bash WHERE id = 45

CREATE TABLE
  IF NOT EXISTS links (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    link TEXT NOT NULL
  )