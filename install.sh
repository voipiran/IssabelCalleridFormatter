#!/bin/bash

echo "Install VOIPIRAN CallerID Formatter"
echo "VOIPIRAN.io"
echo "VOIPIRAN Panel 1.0"
sleep 1

#############################ThePanel

filesPath=voipiran
####Fetch DB root PASSWORD
rootpw=$(sed -ne 's/.*mysqlrootpwd=//gp' /etc/issabel.conf)

####Install Source Gaurdian Files
echo "------------START-----------------"
# Get PHP version
php_version=$(php -r "echo PHP_MAJOR_VERSION;")

# Perform actions based on PHP version
if [ "$php_version" -eq 5 ]; then
    echo "PHP 5 detected. Performing action A."

sleep 1
else
    echo "PHP 7 (or newer) detected. Performing action B."

####Add from-internal-custom
# File to check
FILE="/etc/asterisk/extensions_custom.conf"

# Line to search for
LINE="[from-internal-custom]"

    # Check if the line exists in the file
    if grep -qF "$LINE" "$FILE"; then
       echo "The line '$LINE' exists in the file '$FILE'."
    else
        echo "The line '$LINE' does not exist in the file '$FILE'. Adding the line."
       echo "$LINE" | sudo tee -a "$FILE"
    fi

sleep 1
fi
echo "INFO: SourceGuardian Files have Moved Sucsessfully"
sleep 1

#NumberFormater
echo "" >> /etc/asterisk/extensions_custom.conf
echo ";;VOIPIRAN.io" >> /etc/asterisk/extensions_custom.conf
echo "#include extensions_voipiran_numberformatter.conf" >> /etc/asterisk/extensions_custom.conf
yes | cp -rf extensions_voipiran_numberformatter.conf /etc/asterisk
chown -R asterisk:asterisk /etc/asterisk/extensions_voipiran_numberformatter.conf
chmod 777 /etc/asterisk/extensions_voipiran_numberformatter.conf

### Add from-pstn Context
echo "" >> /etc/asterisk/extensions_custom.conf
echo ";;VOIPIRAN.io" >> /etc/asterisk/extensions_custom.conf
echo "[from-pstn-custom]" >> /etc/asterisk/extensions_custom.conf
echo "exten => _.,1,Set(IS_PSTN_CALL=1)" >> /etc/asterisk/extensions_custom.conf
echo "exten => _.,n,Gosub(numberformatter,s,1)" >> /etc/asterisk/extensions_custom.conf
echo "exten => _.,n,NoOp(end-from-pstn)" >> /etc/asterisk/extensions_custom.conf

### Restart Services
systemctl reload asterisk

