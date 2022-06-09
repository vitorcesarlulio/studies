DECLARE @Login VARCHAR(50) = 'RODRIGO'

EXEC master..sp_addsrvrolemember @loginame = @Login , @rolename = 'sysadmin'

EXEC master..sp_addsrvrolemember @loginame = @Login , @rolename = 'securityadmin'

EXEC sp_change_users_login 'Update_One', @Login, @Login