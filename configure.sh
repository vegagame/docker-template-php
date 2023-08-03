#!/bin/bash

echo "Enter host (eg: my-domain)"
# shellcheck disable=SC2162
read host

echo "Enter network (eg: my-project)"
# shellcheck disable=SC2162
read network

echo "GithubToken (eg: ghp_xxx)"
# shellcheck disable=SC2162
read gitHubToken

# Replace in file function
replaceInFiles () {
  sed -i'.bak'  -e"s/\${network}/$network/; s/\${host}/$host/; s/\${gitHubToken}/$gitHubToken/" "$1"
  rm "$1"".bak"
}

replaceInFiles "./nginx/conf.d/conf.conf"
replaceInFiles "./traefik/config.yml"
replaceInFiles "./.env"
replaceInFiles "./docker-compose.yml"


mkdir certs && cd certs && mkcert -install local-cert && cd ..
mkcert -cert-file certs/local-cert.pem -key-file certs/local-key.pem "$host.localhost" "*.$host.localhost"

docker network create "$network"

echo "App available in: https://$host.localhost/";
echo "The application will be available in dir: app";
echo "Start environment with docker-compose  up -d";
echo "Good work 😀";

