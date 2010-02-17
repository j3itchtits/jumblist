@echo off
echo You are about to generate the jumblist database sql
pause
"C:\Program Files\Microsoft SQL Server\90\Tools\Publishing\1.2\sqlpubwiz" script -d JumblistDatabase "C:\Projects\Mvc\Jumblist\Project\Sql\JumblistDatabase.sql" -f
pause