
# Mauvaise idée...

FROM docker.io/debian:bullseye-slim
RUN apt update -qq 
RUN apt install -qq -y wget 
RUN apt clean 
RUN rm -rf /var/lib/apt/lists/*
RUN wget http://xcal1.vodafone.co.uk/10MB.zip 
RUN rm -f 10MB.zip


# Mieux...

FROM docker.io/debian:bullseye-slim
RUN apt update -qq && apt install -qq -y wget && apt clean && rm -rf /var/lib/apt/lists/*
RUN wget http://xcal1.vodafone.co.uk/10MB.zip && rm -f 10MB.zip


# Commandes

docker history --no-trunc monimage:maversion
docker history xavki:v1.0 --format "{{.ID}}\t{{.CreatedBy}}"
docker diff


# et pour les secrets...

FROM docker.io/debian:bullseye-slim
RUN echo "monsecret" > xavki.txt
RUN rm xavki.txt


