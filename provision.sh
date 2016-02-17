#!/bin/bash

function log {
  message=$1;
  echo "####################################";
  echo "[PROVISION] => ${message}";
  echo "####################################";
}

function apt_get_install {
  package=$1;
  log "install package = ${package}";
  sudo apt-get install -y ${package}
}

log "update apt-get";
sudo apt-get update;

apt_get_install "htop";
