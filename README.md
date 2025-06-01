# Moodle_Migration

Dieses Projekt zeigt die Migration einer bestehenden Moodle-Installation in eine moderne Docker-Umgebung.

## Projektstruktur

├── Dockerfiles/
│ ├── Dockerfile_version-4.1.2/
│ ├── Dockerfile_version-4.2.3/
│ └── Dockerfile_version-5.0/
├── backup_moodle.sh
├── config.php
├── docker-compose.yml
├── README.md


## Voraussetzungen

- Docker
- Docker Compose
- Internetzugang (für das Herunterladen von Moodle)

## Schnellstart

1. Repository klonen:

```bash
git clone https://github.com/Edon274/Moodle_Migration.git
cd Moodle_Migration
