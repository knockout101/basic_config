#!/bin/sh

apt-get update
apt-get install nala
nala install zoxide
echo "export PATH=\"\$PATH:/opt/nvim/\"" >> ~/.bashrc
