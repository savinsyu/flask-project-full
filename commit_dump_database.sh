#!/bin/bash
~/AppData/Local/Programs/Python/Python312/python.exe dump.py &
DATE=$(date)
TEXT="Add commit database dump $DATE"
git add dump
git commit -m "$TEXT"
git push