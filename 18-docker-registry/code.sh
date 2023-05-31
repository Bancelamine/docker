mkdir /{registry,certs,auth}

### Sans Auth

openssl req -newkey rsa:4096 -nodes -sha256 -keyout /certs/registry.xavki.local.key -addext "subjectAltName = DNS:registry.xavki.local" -x509 -days 365 -out /certs/registry.xavki.local.crt

cat /etc/docker/daemon.json
{
  "insecure-registries" : ["registry.xavki.gitlab:5050","registry.xavki.local:443"]
}

# copie du crt

docker run -d --restart=always --name registry -v /certs:/certs -v /registry/:/registry/ -e REGISTRY_HTTP_ADDR=0.0.0.0:443 -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/registry.xavki.local.crt -e REGISTRY_HTTP_TLS_KEY=/certs/registry.xavki.local.key -e REGISTRY_STORAGE_FILESYSTEM_ROOTDIRECTORY=/registry/ -p 443:443 registry:2

curl -sSL --insecure https://172.17.0.2:443/v2/_catalog
curl -sSL --insecure https://registry.xavki.local/v2/_catalog

docker tag excalidraw/excalidraw:latest registry.xavki.local/myimage:v1.0.0
docker push registry.xavki.local/myimage:v1.0.0



### Avec Auth

docker run -d --restart=always --name registry -v /certs:/certs -v /auth/:/auth -v /registry/:/registry/ -e REGISTRY_AUTH=htpasswd -e REGISTRY_AUTH_HTPASSWD_REALM="Registry Realm" -e REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd -e REGISTRY_HTTP_ADDR=0.0.0.0:443 -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/registry.xavki.local.crt -e REGISTRY_HTTP_TLS_KEY=/certs/registry.xavki.local.key -e REGISTRY_STORAGE_FILESYSTEM_ROOTDIRECTORY=/registry/ -p 443:443 registry:2

docker run --entrypoint htpasswd httpd:2 -Bbn xavki password > auth/htpasswd
docker tag excalidraw/excalidraw:latest registry.xavki.local/myimage2:v1.0.0
docker push registry.xavki.local/myimage2:v1.0.0
docker login registry.xavki.local
