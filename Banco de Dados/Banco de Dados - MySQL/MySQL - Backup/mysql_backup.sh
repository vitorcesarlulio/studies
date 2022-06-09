#!/bin/bash
#set -x

# DB's
DB_1='sipsnet'
DB_2='sipsnet_DB_2'
DB_3='sipsnet_DB_3'

# Access
DB_USER='user'
DB_PASS='senha'

# Parametros
DB_PARAM='--add-drop-table --add-locks --extended-insert --single-transaction -quick'
DATE=`date +%Y-%m-%d`
HORA=`date +%H`
MYSQLDUMP=/usr/bin/mysqldump
BACKUP_DIR=/backup/mysql
BACKUP_NAME_DB_1=mysql_$DB_1-$DATE.sql
BACKUP_NAME_DB_2=mysql_$DB_2-$DATE.sql
BACKUP_NAME_DB_3=mysql_$DB_3-$DATE.sql
BACKUP_TAR=mysql-"$DATE"_"$HORA".tar.bz2

# Gerando arquivo sql
$MYSQLDUMP $DB_1 $DB_PARAM -u $DB_USER -p$DB_PASS > $BACKUP_DIR/$BACKUP_NAME_DB_1
$MYSQLDUMP $DB_2 $DB_PARAM -u $DB_USER -p$DB_PASS > $BACKUP_DIR/$BACKUP_NAME_DB_2
$MYSQLDUMP $DB_3 $DB_PARAM -u $DB_USER -p$DB_PASS > $BACKUP_DIR/$BACKUP_NAME_DB_3

# Compactando arquivo em tar.gz
tar -cvjf $BACKUP_DIR/$BACKUP_TAR $BACKUP_DIR/*.sql
if [[ $? -eq 1 ]]; then
echo "Compressao do arquivo $BACKUP_TAR FALHOU!" | mailx -v -s "AWS: Backup Notification - FAIL" -S from="servidor de backup webmaster@tal.com.br" email para enviar
exit 1
fi

# Excluindo arquivos desnecessarios
rm -rf $BACKUP_DIR/*.sql

# Copia backup para DB_2
rsync -arvz -e 'ssh -p 5022' --progress $BACKUP_DIR/ mtpfw.ddns.net:/data/backup/mysql/aws/ > rsync_$DATE.log

# Send email
if [[ $? -eq 0 ]]; then
cat rsync_$DATE.log | mailx -v -s "AWS: Backup Notification - SUCCESS" -S from="servidor de backup webmaster@tal.com.br" email para enviar
exit 1
else
cat rsync_$DATE.log | mailx -v -s "AWS: Backup Notification - FAIL" -S from="servidor de backup webmaster@tal.com.br" email para enviar
fi

