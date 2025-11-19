#!/usr/bin/env bash
set -e

# Expect these env vars from docker run:
# HOST_UID, HOST_GID, HOST_USER
: "${HOST_UID:?HOST_UID not set}"
: "${HOST_GID:?HOST_GID not set}"
: "${HOST_USER:?HOST_USER not set}"

# Ensure group with host GID exists
if ! getent group "$HOST_GID" >/dev/null; then
  groupadd -g "$HOST_GID" hostgrp
fi

# Ensure user with host UID exists (bind to that GID)
if ! id -u "$HOST_USER" >/dev/null 2>&1; then
  useradd -m -u "$HOST_UID" -g "$HOST_GID" -s /bin/bash "$HOST_USER"
fi

# Make sure the mount is owned by you
chown -R "$HOST_UID:$HOST_GID" /workspace || true

# Drop into your user with /workspace as home
exec su -s /bin/bash "$HOST_USER" -c "export HOME=/workspace; cd /workspace; exec \"$@\""
