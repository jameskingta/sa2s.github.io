#!/bin/bash

usermod -u $HOST_USER_ID www-data
groupmod -g $HOST_USER_ID www-data

chown -hR www-data:www-data /var/www

if [ ! -f /usr/local/etc/php/php.ini ]; then
  cat <<EOF > /usr/local/etc/php/php.ini
date.timezone = $PHP_INI_DATE_TIMEZONE
display_errors = On
EOF
fi

exec apache2-foreground
