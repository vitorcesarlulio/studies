--DROP FUNCTION FSOMAR
CREATE OR ALTER FUNCTION FSOMAR()
RETURNS NUMERIC AS
BEGIN
  RETURN 1 + 1
END
GO

--USO
BEGIN
  DECLARE @RET NUMERIC
  EXEC @RET=FSOMAR
  PRINT @RET
END

SELECT DBO.FSOMAR()













--DROP FUNCTION FSOMAR2
CREATE OR ALTER FUNCTION FSOMAR2(
  @N1 NUMERIC,
  @N2 NUMERIC
)
RETURNS NUMERIC AS
BEGIN
  --PRINT '1� N� = '+CAST(@N1 AS VARCHAR)
  --PRINT '2� N� = '+CAST(@N2 AS VARCHAR)

  RETURN @N1 + @N2
END
GO


--ERRO
SELECT FSOMAR2(50,35)

--CORRETO
SELECT DBO.FSOMAR2(50,35)



BEGIN
  DECLARE @RET NUMERIC
  DECLARE @N1 NUMERIC = 10
  DECLARE @N2 NUMERIC = 20

  PRINT '1� N� = '+CAST(@N1 AS VARCHAR)
  PRINT '2� N� = '+CAST(@N2 AS VARCHAR)

  SELECT @RET = DBO.FSOMAR2(50,35)

  PRINT '--------------'
  PRINT 'SOMA = '+CAST(@RET AS VARCHAR)
END












--DROP FUNCTION FSOMAR
CREATE OR ALTER FUNCTION FPOEASPAS(@P1 VARCHAR(MAX))
RETURNS VARCHAR(MAX) AS
BEGIN
  RETURN '" '+@P1+' "'
END
GO


SELECT DBO.FPOEASPAS('HOJE � S�BADO') AS COMFUNC, 
       'HOJE � S�BADO' AS SEMFUNC

