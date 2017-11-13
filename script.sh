#!/bin/bash

docker stop $(docker ps -q)

docker build -t $1 .
 
docker run -d --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 8001:8001 $1

#cd myapp ; rm -rf * ; cd ..
#cp -R /var/lib/docker/volumes/myapp/_data/* /docker/ionic/myapp/
