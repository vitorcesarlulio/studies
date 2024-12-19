# Caminho do diretório que deseja listar
$diretorio = "C:\Github\studies"

# Arquivo onde será salvo o relatório
$arquivoSaida = "C:\Users\vitorlulio\Desktop\Relatorio_UTF8.txt"

# Listar todos os arquivos e pastas no diretório
Get-ChildItem -Path $diretorio -Recurse | 
Select-Object FullName, Name, @{Name="Type";Expression={if ((Get-Item $_.FullName).PSIsContainer) {"Folder"} else {"File"}}}, Length, LastWriteTime |
Out-File -FilePath $arquivoSaida -Encoding UTF8

Write-Host "Relatório gerado em $arquivoSaida com codificação UTF-8"
