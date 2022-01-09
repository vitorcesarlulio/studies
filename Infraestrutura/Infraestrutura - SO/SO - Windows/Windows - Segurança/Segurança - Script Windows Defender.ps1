# Executar como Administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

<#
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::                                                                     ::::
:::::          PS1 para verificar windows com windows defender		      ::::
:::::                                                                     ::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::                                                                     ::::
:::::             Author: Vítor César Lulio                               ::::
:::::             Data: 01/07/2021                                        ::::
:::::             Versão: 0.0.0                                           ::::
:::::             Linkedin: linkedin.com/in/vitor-cesar-lulio/            ::::
:::::             GitHub: github.com/vitorcesar019                        ::::
:::::                                                                     ::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#>
# Obs.: é necessário adicionar esse script ao agendador de tarefas do Windows

<#
	Referencias:
		https://www.makeuseof.com/how-to-use-powershell-to-scan-windows-10-for-malware/
		https://www.windowscentral.com/how-manage-microsoft-defender-antivirus-powershell-windows-10
#>

# Baixar pacotes atualização Windows Defender
	# Update-MpSignature
		
# Atualiza as preferências do Microsoft Defender para verificar atualizações de definição todos os dias da semana automaticamente
	# Set-MpPreference -SignatureScheduleDay Everyday
		
# Verificação rápida todos os dias	
	# Set-MpPreference -ScanScheduleQuickScanTime 14:00:00
	
# Verificação rápida manual
	# Start-MpScan -ScanType QuickScan
		
# Verificação completa
	# Start-MpScan -ScanType FullScan
	# em segundo plano
		# Start-MpScan -ScanType FullScan -AsJob
			
# Verificação offline (tem que ver pq parece que tem que fechar tudi)
	# Start-MpWDOScan
	
# Agende uma verificação antivírus completa
	# Rode o comando abaixo
		Set-MpPreference -ScanParameters 2
			
	# Substitua "Scan_Day" por um número entre "0" e "7", onde "0" = todos os dias e 1-7 indicam o dia específico da semana começando no domingo
		Set-MpPreference -RemediationScheduleDay Scan_Day
			
	# Substitua Scan_Time pelo tempo de 24 horas que você deseja escolher
		Set-MpPreference -RemediationScheduleTime Scan_Time
		