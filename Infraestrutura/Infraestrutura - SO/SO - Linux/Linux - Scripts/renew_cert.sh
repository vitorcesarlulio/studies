#!/bin/bash
set -x
DOMAIN="dominio"
TOMCAT_KEY_PASS="senha"
CERTBOT_BIN="/usr/bin/certbot"
EMAIL_NOTIFICATION="email"
HOSTNAME=$(hostname)

# Install certbot
install_certbot () {
    if [[ ! -f /usr/bin/certbot ]]; then
        wget https://dl.eff.org/certbot-auto -P /usr/local/bin
        chmod a+x $CERTBOT_BIN
    fi
}

# Attempt cert renewal:
renew_ssl () {
        DATE=$(echo | openssl s_client -servername $HOSTNAME -connect localhost:8443 -servername ${DOMAIN} 2>/dev/null | openssl x509 -noout -enddate | awk -F'=' {'print $2'})
        TIMESTAMP=$(date --date="$DATE" --utc +"%m/%d/%Y")
        EXPIRATION=`date -d "$TIMESTAMP" +%s`

        # convert current date to seconds
        CURRENTDATE=`date +%s`
        EXPIRATIONDAY=$((($EXPIRATION - $CURRENTDATE) / 86400 ))

        #if [[ "$EXPIRATIONDAY" -le 5 ]]; then
                ${CERTBOT_BIN} renew --cert-name ${DOMAIN} > /tmp/crt_tal.txt
                cat /tmp/crt_tal.txt | grep "No renewals were attempted"
        #       if [[ $? -eq "0" ]]; then
        #               echo "Cert not yet due for renewal"
        #               exit 0
        #       fi

                echo "Renewing ssl certificate..."

                # create a PKCS12 that contains both your full chain and the private key
                rm -f /tmp/${DOMAIN}_fullchain_and_key_tal.p12 2>/dev/null
                openssl pkcs12 -export -out /tmp/${DOMAIN}_fullchain_and_key_tal.p12 \
                -passin pass:$TOMCAT_KEY_PASS \
                -passout pass:$TOMCAT_KEY_PASS \
                -in /etc/letsencrypt/live/$DOMAIN/fullchain.pem \
                -inkey /etc/letsencrypt/live/$DOMAIN/privkey.pem \
                -name tomcat

                # stop tomcat
                systemctl stop tomcat9
                sleep 10

                # Convert that PKCS12 to a JKS
                rm -f /opt/tomcat9/conf/keystore_tal.jks 2>/dev/null
                keytool -importkeystore -deststorepass $TOMCAT_KEY_PASS -destkeypass $TOMCAT_KEY_PASS \
                  -destkeystore /opt/tomcat9/conf/keystore_tal.jks -srckeystore /tmp/${DOMAIN}_fullchain_and_key_tal.p12  \
                  -srcstoretype PKCS12 -srcstorepass $TOMCAT_KEY_PASS \
                  -alias tomcat
                chown tomcat.tomcat /opt/tomcat9/conf/keystore_tal.jks
                echo "1" > /tmp/status
        #else
        #       echo "0" > /tmp/status
        #       exit 0
        #fi
}

# Send email notification on completion
send_email_notification () {
        if [[ "$(cat /tmp/status)" == "1" ]]; then
    #if [[ $? -eq "0" ]]; then
        echo "Starting tomcat server"
        systemctl start tomcat9
        if [[ $? -eq "0" ]]; then
            echo "" > /tmp/success
            echo "Letsencrypt ssl certificate for $DOMAIN successfully renewed by cron job." >> /tmp/success
            echo "" >> /tmp/success
            echo "Tomcat successfully restarted after renewal" >> /tmp/success
            cat /tmp/success | mailx -v -s "$DOMAIN Letsencrypt renewal" -S from="webmaster@tal.com.br" $EMAIL_NOTIFICATION
        else
            echo "" > /tmp/failure
            echo "Letsencrypt ssl certificate for $DOMAIN renewal by cron job failed." >> /tmp/failure
            echo "" >> /tmp/failure
            echo "Try again manually.." >> /tmp/failure
            cat /tmp/failure | mailx -v -s "$DOMAIN Letsencrypt renewal" -S from="webmaster@tal.com.br" $EMAIL_NOTIFICATION
        fi
    fi
}

# Main
install_certbot
renew_ssl
send_email_notification

