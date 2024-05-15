#!/bin/bash
# Запускаем скрпит дампа базы данных
venv/scripts/python.exe dump.py

# Копируем скрипты sql в папку sql-scripts из рабочего пространства dbeaver
cp ~/dbeaver-ce-24.0.4-win32.win32.x86_64/dbeaver/bases/work/Scripts/Flask.sql /p/s.savin/flask_project/sql-scripts

# Запускаем само приложение
venv/scripts/python.exe app.py

# Приложение открывается в браузере по умолчанию
venv/scripts/python.exe -m webbrowser http://127.0.0.1:82

# Скрипт создания и отправки коммита
set text= "Reserve Copy: %date%   %time% "
git add .
git commit -m %text%
git push