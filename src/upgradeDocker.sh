#!/bin/bash
echo "overwriting /usr/local/bin/docker"
sleep 1
echo '!'
sleep 1
echo '!'
sleep 1
echo '!'
sleep 1
echo '!'
cd /tmp
wget https://get.docker.com/builds/Linux/x86_64/docker-latest
chmod +x docker-latest
sudo mv docker-latest /usr/local/bin/docker
