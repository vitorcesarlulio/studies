#!/bin/bash

set -x

DOMAIN="dominio"
TOMCAT_KEY_PASS="senha"
CERTBOT_BIN="/usr/bin/certbot"
EMAIL_NOTIFICATION="email para notificacao"
HOSTNAME=$(hostname)

openssl pkcs12 -export -out /tmp/${DOMAIN}_fullchain_and_key_unica.p12 \
-passin pass:$TOMCAT_KEY_PASS \
-passout pass:$TOMCAT_KEY_PASS \
-in /etc/letsencrypt/live/$DOMAIN/fullchain.pem \
-inkey /etc/letsencrypt/live/$DOMAIN/privkey.pem \
-name tomcat

keytool -importkeystore -deststorepass $TOMCAT_KEY_PASS -destkeypass $TOMCAT_KEY_PASS \
  -destkeystore /opt/tomcat9/conf/keystore_unica.jks -srckeystore /tmp/${DOMAIN}_fullchain_and_key_unica.p12  \
  -srcstoretype PKCS12 -srcstorepass $TOMCAT_KEY_PASS \
  -alias tomcat
