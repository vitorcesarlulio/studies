@ECHO off

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::                                                                     ::::
:::::          Bat para apagar arquivos temporários de navegadores        ::::
:::::                                                                     ::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::                                                                     ::::
:::::             Author: Vítor César Lulio                               ::::
:::::             Data: 28/05/2021                                        ::::
:::::             Versão: 0.0.0                                           ::::
:::::             Linkedin: linkedin.com/in/vitor-cesar-lulio/            ::::
:::::             GitHub: github.com/vitorcesar019                        ::::
:::::                                                                     ::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Execute esse .bat como administrador, caso contrário algumas pastas não serão limpas (arquivos temporários por exemplo)
:: Opção: adicione esse script no agendador de tarefas do Windows. Lembre-se de marcar a opção "Executar com privilégios mais altos"

@ECHO Limpeza dos navegadores iniciada...

@ECHO -----------------------------------------------------------------
@ECHO Arquivos temporários do navegador Edge sendo apagados...
@ECHO -----------------------------------------------------------------
	TASKKILL /F /IM "msedge.exe"
	DEL C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\Cache\data*.
	DEL C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\Cache\f*.
	DEL C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\Cache\index.
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\Database\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\CacheStorage\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\"Service Worker"\ScriptCache\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\GPUCache\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\GrShaderCache\GPUCache\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\ShaderCache\GPUCache\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\Default\Storage\ext\

	DEL C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\Cache\data*.
	DEL C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\Cache\f*.
	DEL C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\Cache\index.
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\"Service Worker"\Database\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\"Service Worker"\CacheStorage\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\"Service Worker"\ScriptCache\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\GPUCache\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 1"\Storage\ext\
	
	DEL C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\Cache\data*.
	DEL C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\Cache\f*.
	DEL C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\Cache\index.
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\"Service Worker"\Database\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\"Service Worker"\CacheStorage\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\"Service Worker"\ScriptCache\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\GPUCache\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\"User Data"\"Profile 2"\Storage\ext\
@ECHO -----------------------------------------------------------------
@ECHO Arquivos temporários do navegador Edge apagados com sucesso!
@ECHO -----------------------------------------------------------------

@ECHO -----------------------------------------------------------------
@ECHO Arquivos temporários do navegador Mozilla Firefox sendo apagados...
@ECHO -----------------------------------------------------------------
	TASKKILL /F /IM "firefox.exe"
	:: Define qual é a pasta Profile do usuário e apaga os arquivos temporários dali
	set parentfolder=C:\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles\
	for /f "tokens=*" %%a in ('"dir /b "%parentfolder%"|findstr ".*\.default-release""') do set folder=%%a
	DEL C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\cache2\entries\*.
	DEL C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\startupCache\*.bin
	DEL C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\startupCache\*.lz*
	DEL C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\cache2\index*.*
	DEL C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\startupCache\*.little
	DEL C:\Users\%USERNAME%\AppData\local\Mozilla\Firefox\Profiles\%folder%\cache2\*.log /s /q
@ECHO -----------------------------------------------------------------
@ECHO Arquivos temporários do navegador Mozilla Firefox apagados com sucesso!
@ECHO -----------------------------------------------------------------

@ECHO -----------------------------------------------------------------
@ECHO Arquivos temporários do navegador Brave sendo apagados...
@ECHO -----------------------------------------------------------------
	TASKKILL /F /IM "brave.exe"
	DEL C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\Cache\data*.
	DEL C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\Cache\f*.
	DEL C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\Cache\index.
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Service Worker"\Database\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Service Worker"\CacheStorage\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\"Service Worker"\ScriptCache\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\GPUCache\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\GrShaderCache\GPUCache\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\ShaderCache\GPUCache\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\Default\Storage\ext\
	
	DEL C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 1"\Cache\data*.
	DEL C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 1"\Cache\f*.
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 1"\"Service Worker"\Database\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 1"\"Service Worker"\CacheStorage\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 1"\"Service Worker"\ScriptCache\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 1"\GPUCache\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 1"\Storage\ext\
	
	DEL C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 2"\Cache\data*.
	DEL C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 2"\Cache\f*.
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 2"\"Service Worker"\Database\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 2"\"Service Worker"\CacheStorage\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 2"\"Service Worker"\ScriptCache\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 2"\GPUCache\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\"User Data"\"Profile 2"\Storage\ext\
@ECHO -----------------------------------------------------------------
@ECHO Arquivos temporários do navegador Brave apagados com sucesso!
@ECHO -----------------------------------------------------------------

@ECHO -----------------------------------------------------------------
@ECHO Arquivos temporários do navegador Google Chrome sendo apagados...
@ECHO -----------------------------------------------------------------
	TASKKILL /F /IM "chrome.exe"
	DEL C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\Cache\data*.
	DEL C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\Cache\f*.
	DEL C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\Cache\index.
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\Database\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\CacheStorage\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\"Service Worker"\ScriptCache\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\GPUCache\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\GrShaderCache\GPUCache\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\ShaderCache\GPUCache\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\Default\Storage\ext\
	
	DEL C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\Cache\data*.
	DEL C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\Cache\f*.
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\"Service Worker"\Database\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\"Service Worker"\CacheStorage\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\"Service Worker"\ScriptCache\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\GPUCache\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 1"\Storage\ext\
	
	DEL C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\Cache\data*.
	DEL C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\Cache\f*.
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\"Service Worker"\Database\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\"Service Worker"\CacheStorage\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\"Service Worker"\ScriptCache\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\GPUCache\
	RMDIR /q /s C:\Users\%USERNAME%\AppData\Local\Google\Chrome\"User Data"\"Profile 2"\Storage\ext\
@ECHO -----------------------------------------------------------------
@ECHO Arquivos temporários do navegador Brave apagados com sucesso!
@ECHO -----------------------------------------------------------------

:: OPÇÃO Instala e inicializa o Firemin para otimizar firefox
	:: CD /d %~dp0
	:: xcopy Utilitarios\Firemin c:\Firemin /i /y
	:: copy c:\Firemin\Firemin_X64.lnk "%ProgramData%\Microsoft\Windows\Start Menu\Programs\StartUp\Firemin_X64.lnk" /y
	:: start c:\Firemin\Firemin_X64.lnk

exit

