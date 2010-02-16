@echo off
echo You are about to apply the jumblist database sql
pause
"C:\Program Files\Microsoft SQL Server\100\Tools\Binn\sqlcmd" -S x8hp9l2j\sqlexpress -i "C:\Projects\Mvc\Jumblist\Project\Sql\JumblistDatabase.sql"
pause

