#!/bin/sh
set -e

CONFIG=/etc/orthanc/orthanc.json

# Substitute environment variables into the Orthanc config
sed -i "s/\${ORTHANC_USER}/${ORTHANC_USER}/g" "$CONFIG"
sed -i "s/\${ORTHANC_PASSWORD}/${ORTHANC_PASSWORD}/g" "$CONFIG"

echo "Starting Orthanc..."
exec /usr/local/sbin/Orthanc "$CONFIG"