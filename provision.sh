#!/bin/bash

function log {
  message=$1;
  echo "####################################";
  echo "[PROVISION] => ${message}";
  echo "####################################";
}

function run_as_vagrant {
  bash_command=$1;
  sudo su vagrant -c "${bash_command}";
}

function apt_get_install {
  package=$1;
  log "install package = ${package}";
  sudo apt-get install -y ${package};
}

function git_clone {
  project=$1;
  folder="projects/${project}";
  run_as_vagrant "mkdir -p ${folder}";
  if [ ! -d "${folder}/.git/" ]; then
    echo "git clone = ${project}"
    git clone https://github.com/${project}.git ${folder};
  else
    echo "git already cloned = ${project}";
  fi
}

log "update apt-get";
sudo apt-get update;

apt_get_install "htop";
apt_get_install "git";

git_clone "hashrocket/dotmatrix";
