#!/bin/bash
DATE=$(date)
TEXT="Add commit database dump$DATE"
git add dump
git commit -m "$TEXT"
git push