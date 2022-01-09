
@echo Deletar D:\AGSI\BACKUP com mais de 30 dias
forfiles /p "D:\AGSI\BACKUP" /s /m *.agsi* /c "cmd /c Del @path" /d -30

@echo on