#!/usr/bin/env bash
# originally from http://alexyu.se/content/2012/04/bootstrap-latest-version-chef-solo-debianubuntu-dists
# archiving here
echo "deb http://apt.opscode.com/ `lsb_release -cs`-0.10 main" | sudo tee /etc/apt/sources.list.d/opscode.list
mkdir -p /etc/apt/trusted.gpg.d
mkdir -p /etc/apt/trusted.gpg.d
gpg --keyserver keys.gnupg.net --recv-keys 83EF826A
gpg --export packages@opscode.com | sudo tee /etc/apt/trusted.gpg.d/opscode-keyring.gpg > /dev/null
apt-get -y update
apt-get -y install opscode-keyring
apt-get -y upgrade
apt-get -y install chef
