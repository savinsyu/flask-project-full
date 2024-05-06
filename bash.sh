#!/bin/bash
# Запускаем скрпит дампа базы данных
venv/scripts/python.exe dump.py &&
# Копируем скрипты sql в папку sql-scripts из рабочего пространства dbeaver
cp /p/s.savin/Work/dbeaver/workspace6/General1/Scripts/Flask.sql /p/s.savin/flask_project/sql-scripts &&
# Запускаем само приложение
venv/scripts/python.exe app.py &
# Приложение открывается в браузере по умолчанию
venv/scripts/python.exe -m webbrowser http://127.0.0.1:82
