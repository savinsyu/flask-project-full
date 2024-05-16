#!/bin/bash

# RUS Ниже описанные скрипты приведены как пример, нужно обязательно учитывать размещение каталогов в системе
# ENG Below described scripts are given as an example, it is necessary to take into account the placement of catalogs in the system

# RUS Создание дампа базы данных
# ENG Creating a database dump
venv/scripts/python.exe dump.py

# Копируем скрипты sql в папку sql-scripts из рабочего пространства dbeaver
cp ~/dbeaver-ce-24.0.4-win32.win32.x86_64/dbeaver/bases/work/Scripts/Flask.sql /p/s.savin/flask_project/sql-scripts

# RUS Запускаем приложение
# ENG Launch the application
venv/scripts/python.exe app.py

# RUS Приложение открывается в браузере по умолчанию
# ENG The app opens in the default browser
venv/scripts/python.exe -m webbrowser http://127.0.0.1:82

# RUS Создания и отправки коммита
# ENG Creating and sending a commit
set text= "Reserve Copy: %date%   %time% "
git add .
git commit -m %text%
git push

# RUS Копируем конфигурацию DBeaver
# ENG Copy the DBeaver configuration
cp -r ~/dbeaver-ce-24.0.4-win32.win32.x86_64/dbeaver/bases* /p/s.savin/Work/
