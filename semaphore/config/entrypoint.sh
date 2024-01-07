#!/bin/bash

# Start MySQL service
service mysql start

# Configure MySQL
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$MYSQL_ROOT_PASSWORD';"
mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"

# Modify config.json with the database name and password
jq '.mysql.pass = env.MYSQL_ROOT_PASSWORD | .mysql.name = env.MYSQL_DATABASE' /opt/semaphore/config.json > /opt/semaphore/temp.json && mv /opt/semaphore/temp.json /opt/semaphore/config.json

# Start Semaphore service
semaphore service --config=/opt/semaphore/config.json
