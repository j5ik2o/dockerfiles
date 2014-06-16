#!/bin/sh

set -e

brew tap homebrew/binary
brew install packer

mkdir -p temp
cd temp
git clone https://github.com/momijiame/packer-vanilla-box.git

cd packer-vanilla-box/ubuntu
packer build ubuntu1404.json

cd artifacts
vagrant box add ubuntu1404 ubuntu1404-virtualbox.box


