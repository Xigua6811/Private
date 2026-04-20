@echo off  
git pull --no-rebase origin main  
git add .  
git commit -m "auto sync"  
git push origin main 
