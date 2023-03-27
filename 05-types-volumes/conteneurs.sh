#!/usr/bin/bash

## Bind mount
docker run -d --hostname --mount type=bind,src=/data/,destination=/usr/share/nginx/html/ --name c1 debian:latest

## Docker volume

#Créer un volume
docker volume create mynginx
docker volume ls

#Lancement de conteneur
docker run -d --hostname --mount type=volume,src=mynginx,destination=/usr/share/nginx/html/ --name c1 debian:latest
docker exec -ti c1 bash

#Supprimer des volumes
docker volume rm mynginx

## TMPFS
docker run -d --hostname --mount type=tmpfs,destination=/usr/share/nginx/html/ --name c1 debian:latest

