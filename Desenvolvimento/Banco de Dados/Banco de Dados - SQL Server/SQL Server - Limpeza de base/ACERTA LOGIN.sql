DECLARE @Login VARCHAR(15)

DECLARE c_Cursor CURSOR FOR
  SELECT RTRIM(LTRIM(Usu_Chave))
  FROM Sis_Usuario
  WHERE IsNull(Usu_Ativo,'S') = 'S'

OPEN c_Cursor
FETCH NEXT FROM c_Cursor INTO @Login

WHILE (@@FETCH_STATUS <> -1) BEGIN  

   PRINT @Login

			EXEC sp_addlogin @loginame =  @Login, @passwd = '123SQLacessUser#7&9', @defdb = 'SipsConvenioSocial'

			EXEC sp_adduser @loginame = @Login, @name_in_db = @Login

			EXEC sp_addrolemember @rolename = 'Desenvolvimento', @membername = @Login

			EXEC sp_addsrvrolemember @Login , 'dbcreator'

			EXEC sp_change_users_login 'Update_One', @Login, @Login 

   FETCH NEXT FROM c_Cursor INTO @Login
END
CLOSE c_Cursor
DEALLOCATE c_Cursor