#!/bin/bash
#                         ALTERAR AQUI LOGIN E SENHA DO USUARIO QUE VAI FAZER O BKP
/opt/mssql-tools/bin/sqlcmd -S 127.0.0.1,1433 -U BKP -P 8Tg6.927 -Q "BACKUP DATABASE SipsDentalMaster TO DISK = '/opt/mssql/BackupSQL/SipsDentalMaster.bak' WITH FORMAT, MEDIANAME = 'SQLServerBackups', NAME = 'Full Backup of SipsDentalMaster'"

# Atribui o ano atual a variavel ano.

data=$(date +%Y%m%d%H%M%S)

# Compacta os arquivos de backup de backup.
tar -zcvf /opt/mssql/BackupSQL/Backup_$data.tar.gz /opt/mssql/BackupSQL/*.bak
# Apagar arquivos da pasra após compactado
rm -rf /opt/mssql/BackupSQL/*.bak
