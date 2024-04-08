#!/bin/bash
venv/scripts/python.exe dump.py  && 
venv/scripts/python.exe app.py & 
venv/scripts/python.exe -m webbrowser http://127.0.0.1:82