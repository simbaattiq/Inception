#!/bin/bash

MYSQL_ROOT_PASSWORD=$(cat /run/secrets/db_root_password)
MYSQL_PASSWORD=$(cat /run/secrets/db_password)

if [ -z "$MYSQL_ROOT_PASSWORD" ]; then
  echo "ERROR: /run/secrets/db_root_password is empty. Aborting to avoid creating empty root password." >&2
  exit 1
fi

if [ -z "$MYSQL_PASSWORD" ]; then
  echo "ERROR: /run/secrets/db_password is empty. Aborting to avoid creating empty user password." >&2
  exit 1
fi

service mariadb start;

sleep 5;

mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown;

exec mysqld_safe;
