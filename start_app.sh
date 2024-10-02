#!/bin/bash
venv/Scripts/python.exe app.py &
DATE=$(date)
TEXT="Add commit date: $DATE"
git add .
git commit -m "$TEXT"
git push