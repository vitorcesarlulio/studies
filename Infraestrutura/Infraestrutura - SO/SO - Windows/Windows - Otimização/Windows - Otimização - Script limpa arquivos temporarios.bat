@ECHO off

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::                                                                                                                                         ::::
:::::          Bat verifica integridade do Windows, limpa arquivos temporários, limpa logs, reconfigura redes e desfragmenta disco.           ::::
:::::                                                                                                                                         ::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::                                                                                                                                         ::::
:::::             Author: Vítor César Lulio                                                                                                   ::::
:::::             Data: 28/05/2021                                                                                                            ::::
:::::             Versão: 0.0.0                                                                                                               ::::
:::::             Linkedin: linkedin.com/in/vitor-cesar-lulio/                                                                                ::::
:::::             GitHub: github.com/vitorcesar019                                                                                            ::::
:::::                                                                                                                                         ::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: ATENÇÃO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Execute esse .bat como administrador, caso contrario algumas pastas não serão limpas (arquivos temporários por exemplo)
:: Opção: adicione esse script no agendador de tarefas do Windows. Lembre-se de marcar a opção "Executar com privilégios mais altos"

@ECHO Integridade do Windows sendo checada...
	:: DISM Tool System File Repair.
		:: CheckHealth: determinar rapidamente se há alguma corrupção dentro da imagem local do Windows 10
			DISM /Online /Cleanup-Image /CheckHealth
			
			:: Dorme 30 segundos, /nobreak ignora qualquer comando do usuário, menos um CTRL + C
				timeout /t 25 /nobreak
			
			:: Caso nao deseje exibir a contagem regressiva
				:: timeout /t 25 /nobreak > NUL
			
		:: ScanHealth: varredura mais avançada para determinar se a imagem do sistema operacional tem algum problema
			DISM /Online /Cleanup-Image /ScanHealth
			timeout /t 25 /nobreak
			
		:: RestoreHealth: verificar e reparar problemas comuns automaticamente.
			DISM /Online /Cleanup-Image /RestoreHealth
			timeout /t 25 /nobreak
		
		:: Referencias: 
			:: https://www.windowscentral.com/how-use-dism-command-line-utility-repair-windows-10-image
			
	
	:: SFC System File Repair.
		:: Verificador de arquivos do sistema para reparar arquivos de sistema danificados automática
			"%windir%\system32\sfc.exe" /scannow
			timeout /t 25 /nobreak
	
		:: Referencias: 
			:: https://www.windowscentral.com/how-use-sfc-scannow-command-fix-problems-windows-10
@ECHO Integridade do Windows checada com sucesso!

@ECHO -----------------------------------------------------------------
@ECHO 0.0 Serviços de terceiros sendo interrompidos...
@ECHO -----------------------------------------------------------------
	:: Parando serviços de terceiros
	:: Comentários:
		:: /F 	: Force
		:: /IM : Elimine todos os processos que executam ccleaner64.exe
	
	:: CCleaner
		taskkill /F /IM "ccleaner64.exe"
		taskkill /F /IM "ccleaner.exe"
		
	:: AdwCleaner
		taskkill /F /IM "adwcleaner.exe"
		
	:: Malwarebytes
		taskkill /F /IM "mbam.exe"
	
	:: AINDA EM TESTES
		::net start | find "AdobeARMservice"
		:: if ERRORLEVEL 1 net stop "AdobeARMservice"
		
		:: VER NOME SERVIÇO DO SPYBOT
		:: taskkill /F /IM ".exe"
		
		:: SC QUERY %NOME-DO-SERVICO% > NUL
		:: IF ERRORLEVEL 1060 GOTO notService
		:: 
		:: :: Se instalado:
		:: 	ECHO Servico instalado!
		:: 	GOTO serviceInstall
		:: 
		:: :notService
		:: :: Se não instalado:
		:: 	ECHO Servico nao instalado!
		:: 
		:: :serviceInstall
		:: pause
		
	:: Referências
		:: https://www.windows-commandline.com/taskkill-kill-process/
		:: https://stackoverflow.com/questions/1916050/if-service-exists-condition
		:: https://pt.stackoverflow.com/questions/198051
		
	timeout /t 5 /nobreak
@ECHO -----------------------------------------------------------------
@ECHO 0.1 Serviços de terceiros interrompidos com sucesso!
@ECHO -----------------------------------------------------------------

@ECHO Limpeza do Windows iniciada...

@ECHO -----------------------------------------------------------------
@ECHO 1.0 Arquivos temporários do usuário sendo apagados...
@ECHO -----------------------------------------------------------------
	:: Apaga todas as pastas temporárias e arquivos temporários do usuário
	TAKEOWN /A /R /D Y /F C:\Users\%USERNAME%\AppData\Local\Temp\
	ICACLS C:\Users\%USERNAME%\AppData\Local\Temp\ /grant administradores:F /T /C
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Temp\
	MD C:\Users\%USERNAME%\AppData\Local\Temp\
	
	DEL /s /f /q "%USERPROFILE%\Local Settings\History"\*.*    
	RD /s /q "%USERPROFILE%\Local Settings\History"    
	:: md "%USERPROFILE%\Local Settings\History"    
	DEL /s /f /q "%USERPROFILE%\Local Settings\Temporary Internet Files"\*.*    
	RD /s /q "%USERPROFILE%\Local Settings\Temporary Internet Files"    
	:: md "%USERPROFILE%\Local Settings\Temporary Internet Files"    
	DEL /s /f /q "%USERPROFILE%\Local Settings\Temp"\*.*    
	RD /s /q "%USERPROFILE%\Local Settings\Temp"    
	:: md "%USERPROFILE%\Local Settings\Temp"    
	DEL /s /f /q "%USERPROFILE%\Recent"\*.*    
	RD /s /q "%USERPROFILE%\Recent"    
	:: md "%USERPROFILE%\Recent"    
	DEL /s /f /q "%USERPROFILE%\Cookies"\*.*    
	RD /s /q "%USERPROFILE%\Cookies"    
	:: md "%USERPROFILE%\Cookies"
	
	:: Referências
		:: https://ss64.com/nt/rd.html
		:: https://ss64.com/nt/md.html
		
	timeout /t 5 /nobreak
@ECHO -----------------------------------------------------------------
@ECHO 1.1 Arquivos temporários do usuário apagados com sucesso!
@ECHO -----------------------------------------------------------------

@ECHO -----------------------------------------------------------------
@ECHO 2.0 Arquivos de \Windows\Temp sendo apagados...
@ECHO -----------------------------------------------------------------
	:: Arquivos temporários da pasta temp
	IF EXIST c:\windows\temp\ DEL /f /s /q c:\windows\temp\
	DEL /f /s /q %temp%\
	
	:: Apaga os arquivos de \Windows\Temp
	TAKEOWN /A /R /D Y /F C:\windows\temp
	ICACLS C:\windows\temp /grant administradores:F /T /C
	RMDIR /q /s c:\windows\temp
	MD c:\windows\temp
	
	:: Arquivos temporários da pasta %temp%
	IF EXIST c:\windows\%temp%\ DEL /f /s /q c:\windows\%temp%\
	DEL /f /s /q %temp%\
	
	:: Arquivos temporários da pasta prefetch
	IF EXIST c:\windows\prefetch\ DEL /f /s /q c:\windows\prefetch\
	DEL /f /s /q prefetch\
	
	DEL "%SYSTEMDRIVE%\*.TMP" /F /S /Q
	DEL "%SYSTEMDRIVE%\~*.*" /F /S /Q
	
	del /s /f /q %windir%\system32\dllcache\*.*    
	rd /s /q %windir%\system32\dllcache    
	md %windir%\system32\dllcache
	
	del /s /f /q "%SysteDrive%\Temp"\*.*    
	rd /s /q "%SysteDrive%\Temp"    
	::md "%SysteDrive%\Temp"    
	
	:: Limpando lixeira !!!DESCOMENTE para funcionar!!!
	:: DEL "%SYSTEMDRIVE%\RECYCLER" /F /S /Q
	
	timeout /t 5 /nobreak
@ECHO -----------------------------------------------------------------
@ECHO 2.1 Arquivos temporarios da pasta temp apagados com sucesso!
@ECHO -----------------------------------------------------------------

@ECHO ---------------------------------------------------------------
@ECHO 3.0 Arquivos de log sendo apagados...
@ECHO ---------------------------------------------------------------
	:: Apaga arquivos de log
	DEL C:\windows\logs\cbs\*.log
	DEL C:\Windows\Logs\MoSetup\*.log
	DEL C:\Windows\Panther\*.log /s /q
	DEL C:\Windows\inf\*.log /s /q
	DEL C:\Windows\logs\*.log /s /q
	DEL C:\Windows\SoftwareDistribution\*.log /s /q
	DEL /S /Q /F C:\Windows\SoftwareDistribution\Download\*.*
	FOR /D %%d IN (C:\Windows\SoftwareDistribution\Download\*.*) DO RD /S /Q %%d
	DEL C:\Windows\Microsoft.NET\*.log /s /q
	DEL C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\WebCache\*.log /s /q
	DEL C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\SettingSync\*.log /s /q
	DEL C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Explorer\ThumbCacheToDELete\*.tmp /s /q
	DEL C:\Users\%USERNAME%\AppData\Local\Microsoft\"Terminal Server Client"\Cache\*.bin /s /q
	DEL "%SYSTEMDRIVE%\*.LOG" /F /S /Q
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\INetCache\
	
	timeout /t 5 /nobreak
@ECHO ---------------------------------------------------------------
@ECHO 3.1 Arquivos de log apagados com sucesso!
@ECHO ---------------------------------------------------------------

@ECHO ---------------------------------------------------------------
@ECHO 4.0 Limpeza de disco sendo realizada...
@ECHO ---------------------------------------------------------------
	:: Disk Cleanup Utility.
	
	:: Limpará todos os arquivos automaticamente, sem confirmação
		cleanmgr.exe /verylowdisk /c driveletter
		timeout /t 25 /nobreak
	
	:: O argumento / SAGERUN permite ao usuário iniciar a predefinição configurada (65535 são as caixinhas de seleção já marcadas)
		::"%windir%\system32\cleanmgr.exe" /sagerun:65535
	
	:: Precisa de confirmação
		:: %SystemRoot%\System32\CMD.exe /c Cleanmgr /sageset:65535&Cleanmgr /sagerun:65535
		
	:: Referencias
		:: https://winaero.com/cleanmgr-exe-command-line-arguments-in-windows-10/
@ECHO ---------------------------------------------------------------
@ECHO 4.1 Limpeza simples de disco realizada com sucesso! 
@ECHO ---------------------------------------------------------------

@ECHO ---------------------------------------------------------------
@ECHO 5.0 Limpeza de memoria sendo realizada...
@ECHO ---------------------------------------------------------------
	%windir%\SysWOW64\rundll32.exe advapi32.dll,ProcessIdleTasks
@ECHO ---------------------------------------------------------------
@ECHO 5.1 Limpeza de memoria realizada com sucesso!
@ECHO ---------------------------------------------------------------

@ECHO ---------------------------------------------------------------
@ECHO 6.0 Rede sendo reconfiguranda...
@ECHO ---------------------------------------------------------------
	:: Limpa Windows DNS Resolver Cache.
		ipconfig /flushdns
		
	:: Limpa e dedica um novo IP
		ipconfig /release
		ipconfig /renew
		
	timeout /t 25 /nobreak
@ECHO ---------------------------------------------------------------
@ECHO 6.1 Rede reconfiguranda com sucesso!
@ECHO ---------------------------------------------------------------

:: Referências
:: https://github.com/ricardojrgpimentel/packagedroid-blog/blob/0da3043a8e83df6a9799fa8c82316e21df2ebc13/source/_posts/limpeza-e-optimizacao-do-windows-limpeza-e-optimizacao-do-windows.md
:: https://github.com/wgaabe/Winopt

EXIST
