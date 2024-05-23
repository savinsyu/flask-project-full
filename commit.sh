#!/bin/bash
TEXT="Reserve Copy: %date% %time%"
git add . 
git commit -m %TEXT%
git push 