#!/bin/bash
TIMESTAMP=$(date +"%F-%H%M")
BACKUP_DIR="/opt/mysql_backup/$TIMESTAMP"
MYSQL_USER="root"
MYSQL_PASSWORD="123"
MYSQLDUMP=/usr/bin/mysqldump

mkdir -p "$BACKUP_DIR"

# Дамп базы данных
$MYSQLDUMP --user=$MYSQL_USER --password=$MYSQL_PASSWORD example_db | gzip > "$BACKUP_DIR/example_db.gz"
