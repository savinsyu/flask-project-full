#!/bin/bash
venv/scripts/python.exe dump.py &&
cp ~/AppData/Roaming/DBeaverData/workspace6/General/Scripts/Flask.sql ~/flask_project/scripts/ &&
venv/scripts/python.exe app.py &
venv/scripts/python.exe -m webbrowser http://127.0.0.1:82