#!/bin/sh
set -e

# Fix permissions for .msf4 volume - Docker creates it as root but the
# Metasploit entrypoint runs as the msf user (UID 1000). Ensure the
# directory exists and is owned by msf so writes succeed.
mkdir -p /home/msf/.msf4
# Create user msfconsole.rc to auto-connect to DB on every startup (loaded automatically by msfconsole)
[ -n "$DATABASE_URL" ] && cp /usr/local/share/msf/msfconsole.rc /home/msf/.msf4/msfconsole.rc 2>/dev/null || true
chown -R 1000:1000 /home/msf/.msf4 2>/dev/null || true

# Run the original Metasploit entrypoint
exec /usr/src/metasploit-framework/docker/entrypoint.sh "$@"
