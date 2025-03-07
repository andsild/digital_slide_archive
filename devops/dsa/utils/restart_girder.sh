#!/usr/bin/env bash

port=${1:-8080}
OLDSTART=$(curl --silent 'http://127.0.0.1:${PORT}/api/v1/system/version')
touch /etc/girder.cfg
echo "Girder will now restart"
while true; do NEWSTART=$(curl --silent 'http://127.0.0.1:${PORT}/api/v1/system/version' || true); if [ "${OLDSTART}" != "${NEWSTART}" ]; then echo ${NEWSTART} | grep -q 'release' && break || true; fi; sleep 1; echo -n "."; done
echo ""
echo "Girder has restarted"
