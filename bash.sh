#!/bin/bash
venv/scripts/python.exe dump.py &&
cp /p/s.savin/Work/dbeaver/workspace6/General1/Scripts/Flask.sql /p/s.savin/flask_project/scripts/ &&
venv/scripts/python.exe app.py &
venv/scripts/python.exe -m webbrowser http://127.0.0.1:82