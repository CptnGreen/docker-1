#!/bin/sh

set -e

# create directory for teamspeak files
test -d /data/files || mkdir -p /data/files && chown teamspeak:teamspeak /data/files

# create directory for teamspeak logs
test -d /data/logs || mkdir -p /data/logs && chown teamspeak:teamspeak /data/logs

# create symlinks for all files and directories in the persistent data directory
cd "${TS_DIR}"
for i in /data/*
do
  ln -sf "${i}" .
done

# remove broken symlinks
find -L "${TS_DIR}" -type l -delete

# create symlinks for static files
STATIC_FILES="query_ip_whitelist.txt query_ip_blacklist.txt ts3server.ini ts3server.sqlitedb ts3server.sqlitedb-shm ts3server.sqlitedb-wal .ts3server_license_accepted"

for i in ${STATIC_FILES}
do
  ln -sf /data/"${i}" .
done

export LD_LIBRARY_PATH=".:$LD_LIBRARY_PATH"
exec tini -- ./ts3server "$@"
