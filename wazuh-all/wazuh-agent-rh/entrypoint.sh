#!/bin/bash

/var/ossec/bin/ossec-control start
status=$?
filename="/var/ossec/logs/ossec.log"
if [ $status -ne 0 ]; then
  echo "Failed to start an agent: $status"
  cat /var/ossec/logs/ossec.log
  echo "---------end of ossec log--------"
#  sleep 10000
#  echo `basename "$filename"`
  exit $status
fi

echo "background jobs running, listening for changes"

while sleep 60; do
  /var/ossec/bin/ossec-control status > /dev/null 2>&1
  status=$?
  if [ $status -ne 0 ]; then
    echo "looks like the agent died."
    exit 1
  fi
done
