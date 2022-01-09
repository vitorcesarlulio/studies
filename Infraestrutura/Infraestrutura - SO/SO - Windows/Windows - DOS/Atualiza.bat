@ECHO OFF

ECHO Fechando o Controle
TASKKILL /IM Controle.exe

ECHO Criando diretório
C:
CD\
MD CPA

ECHO Copiando arquivos
COPY \\192.168.10.10\CPA\Controle.Exe C:\CPA\
COPY \\192.168.10.10\CPA\Atualiza.bat C:\CPA\

ECHO Mapeando Unidade de rede
NET USE T: \\192.168.10.10\Transfere

ECHO Abrindo o Controle
start C:\CPA\Controle.exe


ECHO Fim
EXIT