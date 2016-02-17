#!/bin/bash

function log {
  message=$1;
  echo "####################################";
  echo "[PROVISION] => ${message}";
  echo "####################################";
}

log "update apt-get";
sudo apt-get update;
