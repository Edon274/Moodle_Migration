#!/bin/bash

DATE=$(date +%Y-%m-%d)
TIME=$(date +%H-%M)

DAY_DIR="Backup $DATE"
TIME_DIR="Backup (Time $TIME)"

BACKUP_DIR=$(pwd)/backups/"$DAY_DIR"/"$TIME_DIR"
mkdir -p "$BACKUP_DIR"

echo "🔁 Moodle-Backup wird erstellt nach: $BACKUP_DIR"

NETWORK_NAME=$(docker network ls --filter name=moodle_moodlenet --format "{{.Name}}")

docker run --rm \
  --network "$NETWORK_NAME" \
  -e MYSQL_PWD=rootpass \
  mysql:5.7 \
  mysqldump -h mariadb -u root moodle > "$BACKUP_DIR/db_backup.sql"

docker run --rm \
  -v $(pwd)/moodledata:/data \
  -v "$BACKUP_DIR":/backup \
  alpine \
  tar czf /backup/moodledata_backup.tar.gz -C /data .

echo "✅ Backup abgeschlossen!"
echo "📁 Gespeichert in: $BACKUP_DIR"
