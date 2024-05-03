# Создание таблицы

CREATE TABLE
  IF NOT EXISTS git_and_bash (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    command TEXT NOT NULL,
    name TEXT NOT NULL
  )
  
  # Создание таблицы

CREATE TABLE
  IF NOT EXISTS pandas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    command TEXT NOT NULL,
    name TEXT NOT NULL
  );

# Добавление записей в таблицу

INSERT INTO  git_and_bash (command, name) VALUES ('date', 'Вывод текущей даты и времени')

# Добавление нескольких записей в таблицу

INSERT INTO  git_and_bash (command, name) VALUES 
('date', 'Вывод текущей даты и времени'),
('test1', 'test1');

# Поиск в поле значений по части слова

SELECT * FROM git_and_bash WHERE command LIKE '%ls%' 

# Сортировка по убыванию

SELECT * FROM links ORDER BY id DESC

# Сортировка по возрастанию

SELECT * FROM links ORDER BY id ASC

# Удаление определенной записи

DELETE FROM git_and_bash WHERE id = 51;

# Очистка таблицы

DELETE FROM [train];

# Изменение значения записи определенного поля

UPDATE [sql]
SET [name]='Сортировка всех записей по убыванию'
WHERE ([sql].[id] = 3);

# Добавление поля в таблицу

ALTER TABLE [train] ADD [imya] VARCHAR(250) NOT NULL;

# Переименование поля таблицы

ALTER TABLE [train] RENAME COLUMN [train_name] TO [familia];
  

  
   
  


