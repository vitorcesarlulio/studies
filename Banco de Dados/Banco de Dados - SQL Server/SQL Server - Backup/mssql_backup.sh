#!/bin/bash

set -x

bkp_folder='/data/mssql/backup'
database='MINHA BASE'

#ALTERAR AQUI LOGIN E SENHA DO USUARIO QUE VAI FAZER O BKP
sqlcmd -S 127.0.0.1,1433 -U <USUARIO> -P <SENHA> -Q "EXEC sp_BackupDatabases @backupLocation='"$bkp_folder/"', @backupType='F', @DatabaseName = '"$database"'"

#Atribui o ano atual a variavel ano.
data=$(date +%Y%m%d_%H%M%S)

#Compacta os arquivos de backup de backup.
tar -zcvf $bkp_folder/Bkp_$database_$data.tar.gz $bkp_folder/*.BAK

#Apagar arquivos da pasta após compactado
rm -rf $bkp_folder/*.BAK
