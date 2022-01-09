/**
 *	Data: 28/05/2021
 *	Versão: 0.0.0
 *	Linkedin: linkedin.com/in/vitor-cesar-lulio/
 *	GitHub: github.com/vitorcesar019 
 *	Referencias: www.youtube.com/channel/UCAJGpXUFhhISpJTcIQH_c1w
 *	Descrição: query para analisar, após a queda inesperada do banco de dados e após sua volta o mesmo se encontrará no modo Recovery e com a Query abaixo é possível analisar o andam amento do Recovery.
*/

DECLARE @DBName VARCHAR(64) = ‘AdventureWorks2012’
DECLARE @ErrorLog AS TABLE([LogDate] CHAR(24), [ProcessInfo] VARCHAR(64), [TEXT] VARCHAR(MAX))

INSERT INTO @ErrorLog
EXEC master..sp_readerrorlog 0, 1, ‘Recuperação de banco de dados’, @DBName

INSERT INTO @ErrorLog
EXEC master..sp_readerrorlog 0, 1, ‘Recuperação concluída’, @DBName

SELECT TOP 1
@DBName AS [DBName]
,[LogDate]
,CASE
WHEN SUBSTRING([TEXT],10,1) = ‘c’
THEN ‘100%’
ELSE SUBSTRING([TEXT], CHARINDEX(‘) is ‘, [TEXT]) + 4,CHARINDEX(‘ complete (‘, [TEXT]) – CHARINDEX(‘) is ‘, [TEXT]) – 4)
END AS PercentComplete
,CASE
WHEN SUBSTRING([TEXT],10,1) = ‘c’
THEN 0
ELSE CAST(SUBSTRING([TEXT], CHARINDEX(‘approximately’, [TEXT]) + 13,CHARINDEX(‘ seconds remain’, [TEXT]) – CHARINDEX(‘approximately’, [TEXT]) – 13) AS FLOAT)/60.0
END AS MinutesRemaining
,CASE
WHEN SUBSTRING([TEXT],10,1) = ‘c’
THEN 0
ELSE CAST(SUBSTRING([TEXT], CHARINDEX(‘approximately’, [TEXT]) + 13,CHARINDEX(‘ seconds remain’, [TEXT]) – CHARINDEX(‘approximately’, [TEXT]) – 13) AS FLOAT)/60.0/60.0
END AS HoursRemaining
,[TEXT]
FROM @ErrorLog ORDER BY CAST([LogDate] as datetime) DESC, [MinutesRemaining]