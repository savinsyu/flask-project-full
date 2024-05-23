#!/bin/bash
text="Reserve Copy: %date% %time%"
git add . 
git commit -m %text% 
git push 