if [ ! -f /db/database.sqlite ]; then
  cp /db-default/database.sqlite /db/
fi
chmod -R 777 /db

ENV_PORT="80"
if [ -z "${PORT}" ]; then
  ENV_PORT="80"
else
  ENV_PORT="${PORT}"
fi

echo "phpLiteAdmin is started. http://0.0.0.0:$ENV_PORT/"
php -t /var/www/html/ -S 0.0.0.0:$ENV_PORT phpliteadmin.php