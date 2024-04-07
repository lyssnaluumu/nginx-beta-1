IMPORTANT

FOR ANYTHING TO WORK

docker-compose down ; docker image rm $(docker images -q) ; docker build -t web-proxy . --no-cache ; cd .\php\ ; docker build -t php-server . --no-cache ; cd ..\db\ ; docker build -t postgres-server . --no-cache ; cd .. ; docker-compose up -d

copy this command and paste into cli (otherwise it wont work)
