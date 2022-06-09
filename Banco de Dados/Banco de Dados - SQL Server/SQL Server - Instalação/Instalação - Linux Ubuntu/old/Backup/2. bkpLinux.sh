#!/bin/bash
#                         ALTERAR AQUI LOGIN E SENHA DO USUARIO QUE VAI FAZER O BKP
sudo sqlcmd -S 127.0.0.1,1433 -U BKP -P 8Tg6.927 -Q "BACKUP DATABASE SipsDentalMaster TO DISK = '/var/opt/mssql/data/BackupSQL/SipsDentalMaster.bak' WITH FORMAT, MEDIANAME = 'SQLServerBackups', NAME = 'Full Backup of SipsDentalMaster'"

# Atribui o ano atual a variavel ano.

data=$(date +%Y%m%d)

# Compacta os arquivos de backup de backup.

cd /var/opt/mssql/data/BackupSQL/
tar -zcvf Backup_$data.tar.gz *.bak
# Apagar arquivos da pasra após compactado
rm -rf *.bak



