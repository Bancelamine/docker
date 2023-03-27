#!/usr/bin/bash

# Création d'utilisateurs

useradd -u 1111 xavki
useradd -u 1110 xavki2

# Construire une image
cat Dockerfile 
FROM debian:latest
RUN useradd -u 1111 xavki
RUN useradd -u 1112 xavki2

# spécifions le user par l'ID (par le nom aussi)
docker run -d --name c1 -u xavki -v /myvolume/:/data/ myowndebian:v1.0 sleep infinity

##

# même user intérieur et extérieur
docker run -d --name c1 -u xavki -v /myvolume/:/data/ myowndebian:v1.0 sleep infinity

# même id mais nom différent
docker run -d --name c1 -u 1111 -v /myvolume/:/data/ myowndebian:v1.0 sleep infinity

# changement de user sur l'exec uniquement
docker exec -ti xavki bash
docker exec -ti xavki2 bash

# permissions adaptées

#jamais
chmod 777 ... 

#adapter les users
