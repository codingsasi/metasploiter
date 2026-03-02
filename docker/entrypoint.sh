#!/bin/sh
set -e

mkdir -p /home/msf/.msf4
[ -n "$DATABASE_URL" ] && cp /usr/local/share/msf/msfconsole.rc /home/msf/.msf4/msfconsole.rc 2>/dev/null || true
chown -R 1000:1000 /home/msf/.msf4 2>/dev/null || true

exec /usr/src/metasploit-framework/docker/entrypoint.sh "$@"
