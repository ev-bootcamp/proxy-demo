# Anleitung

docker network create proxy_bridge  
cd hello_server/  
apt install nodejs  
apt install npm  
npm init  
npm install express  
docker build -t hello_server .  
docker run --name hello_server --network proxy_bridge --rm -d hello_server  
docker run --network proxy_bridge --name default_nginx -d nginx  
cd ../cert  
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout localhost.key -out   localhost.crt -config localhost.conf  
openssl x509 -in localhost.crt -text  
cd ..  
docker build -t proxy .  
docker run --network proxy_bridge --name proxy -dp443:443 proxy  
