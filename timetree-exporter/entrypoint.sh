#!/usr/bin/env sh
set -e

/usr/local/bin/execute-exporter.sh

exec supercronic /etc/crontab
