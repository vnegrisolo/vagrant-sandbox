#!/bin/bash

function log {
  message=$1
  echo "####################################"
  echo "[PROVISION] => ${message}"
  echo "####################################"
}

function run_as_vagrant {
  bash_command=$1
  sudo su vagrant -c "${bash_command}"
}

function apt_get_update {
  log "update apt-get"
  sudo apt-get update
  sudo curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
}

function apt_get_install {
  package=$1
  log "install package = ${package}"
  sudo apt-get install -y ${package}
}

function npm_install {
  package=$1
  log "install npm package = ${package}"
  sudo npm install -g ${package}
}

function git_clone {
  project=$1
  folder="projects/${project}"
  run_as_vagrant "mkdir -p ${folder}"
  if [ ! -d "${folder}/.git/" ]; then
    git clone https://github.com/${project}.git ${folder}
  fi
}

function set_locales {
  sudo locale-gen "en_US.UTF-8"
  sudo dpkg-reconfigure locales
}

apt_get_update

apt_get_install "build-essential zlib1g-dev libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev"
apt_get_install "htop"
apt_get_install "git"
apt_get_install "nodejs"

npm_install "ember-cli"
npm_install "diff-so-fancy"

set_locales

if [ ! -f ".ssh/id.rsa" ]; then
  run_as_vagrant "ssh-keygen -f .ssh/id.rsa -t rsa -N '' -C 'vinicius.negrisolo@gmail.com'"
fi

git_clone "hashrocket/dotmatrix"
