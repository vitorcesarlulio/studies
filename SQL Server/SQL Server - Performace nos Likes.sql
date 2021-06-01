SET STATISTICS TIME ON
--CTRL + M

SELECT COUNT(*)
FROM tabela
WHERE coluna COLLATE Latin_General_CS_AS LIKE '%Vitor César%' 
--Colation meio default
--CS: Case sensitive
--AS: acente sensitive

SELECT COUNT(*)
FROM tabela
WHERE coluna COLLATE SQL_Latin_General_CPI_CS_AS LIKE '%Vitor César%' --Colation meio default

SELECT COUNT(*)
FROM tabela
WHERE coluna COLLATE Latin_General_BIN LIKE '%Vitor César%' -- Proteus 

-- Obs.:
--	Se possível utilizar apenas um % (no final) já máxima muito o desempenho
--	Se as colunas forem Nvarchar, não muda nada.