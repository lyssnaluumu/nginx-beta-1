FROM nginx:alpine

COPY . /usr/share/nginx/html

EXPOSE 80

# --> full docker update cli <--
# docker-compose down ; docker image rm $(docker images -q) ; docker build -t web-proxy . --no-cache ; cd .\php\ ; docker build -t php-server . --no-cache ; cd ..\db\ ; docker build -t postgres-server . --no-cache ; cd .. ; docker-compose up -d

# docker-compose down
# docker image rm $(docker images -q)

# docker build -t web-proxy . --no-cache
# cd .\php\
# docker build -t php-server . --no-cache
# cd ..\db\
# docker build -t postgres-server . --no-cache
# cd ..
# docker-compose up -d
