# Executar como Administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

<#
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::                                                                     ::::
:::::          PS1 para atualizar windows automaticamente			      ::::
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
# Obs.: é necessário adicionar esse script ao agendador de tarefas do Windows e deixar com privilégios altos

<#
	Referencias:
		https://www.itechtics.com/run-windows-update-cmd/
		https://www.parallels.com/blogs/ras/powershell-windows-update/
#>
# 1. Isso instalará o módulo do Windows Update no PowerShell. Abra o powershell como administrador e rode o comando abaixo
	# Install-Module PSWindowsUpdate


# Este comando verificará se há atualizações. Este é o cmdlet principal do módulo. 
# Ele lista, baixa, instala ou oculta uma lista de atualizações que atendem aos requisitos predefinidos e define as regras de reinicialização ao instalar as atualizações.
	# Get-WindowsUpdate
	
# Este comando instalará as atualizações disponíveis (que foram listadas com comando acima)	
	# Install-WindowsUpdate

# Faz download ou instala todas as atualizações disponíveis
	# AcceptAll
# Ativa regras de firewall para PSWindowsUpdate remoting	
	# Enable-WURemoting
	
# Registra um novo Windows Update API Service Manager	
	# Add-WUServiceManage 
	
# Baixa as atualizações, aceita tudo e instala tudo
	Get-WindowsUpdate -Download -AcceptAll -Install

# CMD
	# Execute o seguinte comando para instalar novas atualizações
	# wuauclt / updatenow