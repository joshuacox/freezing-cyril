#!/bin/bash
echo -n "overwriting /usr/local/bin/docker Ctrl-C now to exit"
for i in {1..5};do sleep 1; echo -n '!'; done
echo '!'
cd /tmp
wget https://get.docker.com/builds/Linux/x86_64/docker-latest
chmod +x docker-latest
sudo mv docker-latest /usr/local/bin/docker
