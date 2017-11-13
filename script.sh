#!/bin/bash

docker stop $(docker ps -q)

docker build -t $1 .
 
docker run -d --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v myapp:/project/amproject -p 8000:8000 $1

cd myapp ; rm -rf * ; cd ..
cp -R /var/lib/docker/volumes/myapp/_data/* /tmp/test/ojet/myapp
