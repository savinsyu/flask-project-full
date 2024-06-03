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

# Добавление нескольких записей в таблицу

INSERT INTO  pandas (command, name) VALUES 
('len(df)', 'Подсчёт количества строк в датафрейме'),
('len(ratings["user_id"].unique())', 'Подсчёт количества уникальных значений в столбце'),
('anime.describe()', 'Вывод статистических сведений о датафрейме'),
('anime.type.value_counts()', 'Для того чтобы подсчитать количество значений в конкретном столбце, можно воспользоваться следующей конструкцие.'),
('anime.columns.tolist()', 'Получение списка значений столбцов'),
('anime["genre"].tolist()', 'Создание списка или объекта Series на основе значений столбца'),
('anime["train set"] = True', 'Присоединение к датафрейму нового столбца с заданным значением'),
('anime[["name","episodes"]]', 'Создание нового датафрейма из подмножества столбцов'),
('anime.drop(["anime_id", "genre", "members"], axis=1).head()', 'Удаление заданных столбцов'),
('anime_modified.iloc[0:3]', 'Получение строк по числовым индексам'),
('anime[anime["type"].isin(["TV", "Movie"])]', 'Для получения строк датафрейма в ситуации, когда имеется список значений столбцов, можно воспользоваться следующей командой'),
('anime[anime["rating"] > 8]', 'Фильтрация по значению'),
('anime.sort_values("rating", ascending=False)', 'Сортировка'),
('anime.groupby("type").count()', 'Функция df.groupby и подсчёт количества записей'),
('anime_modified.loc[["Haikyuu!! Second Season","Gintama"]]', 'Получение строк с нужными индексными значениями'),
('rating.merge(anime, left_on=’anime_id’, right_on=’anime_id’, suffixes=(‘_left’, ‘_right’))', 'Слияние датафреймов'),
('anime.info()', 'Получение сведений о датафрейм');

SELECT * FROM pandas;
SELECT * FROM git_and_bash;

# Поиск в поле значений по части слова

SELECT * FROM git_and_bash WHERE command LIKE '%ls%';

# Сортировка по убыванию

SELECT * FROM links ORDER BY id DESC;

# Сортировка по возрастанию

SELECT * FROM links ORDER BY id ASC;

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
  

  
   
  


