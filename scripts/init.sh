if [[ ! -f /db/database.sqlite ]]; then
  cp /db-default/database.sqlite /db/
fi
chmod -R 777 /db

if [[ -z "${PORT}" ]]; then
  ENV_PORT="80"
else
  ENV_PORT="${PORT}"
fi

php -t /opt/phpliteadmin -S 0.0.0.0:$ENV_PORT phpliteadmin.php