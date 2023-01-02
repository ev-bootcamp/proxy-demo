# Anleitung

## Netzwerk vom Typ Bridge erzeugen
docker network create proxy_bridge 

### Netzwerk prüfen
docker network ls

## Node Server erzeugen
cd hello_server/  
apt install nodejs  
apt install npm  
npm init  
npm install express  
docker build -t hello_server .  

## Node Server starten
docker run --name hello_server --network proxy_bridge --rm -d hello_server  

## Default nginx Webserver starten
docker run --network proxy_bridge --name default_nginx -d nginx  

## Zertifikat erzeugen
cd ../cert  
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout localhost.key -out   localhost.crt -config localhost.conf  
openssl x509 -in localhost.crt -text  

## Proxy erzeugen
cd ..  
docker build -t proxy .  

## Proxy starten
docker run --network proxy_bridge --name proxy -dp443:443 proxy  

## Test default nginx webserver
curl -k https://localhost

## Test hello server
curl -k https://localhost/hello
