#first creat this folder '/home/hbadr/data/wordpress' and '/home/hbadr/data/mariadb'
all :
	@# sudo apt-get  install hostsed
	@# sudo hostsed add 127.0.0.1  hbadr.42.fr
	docker-compose  -f srcs/docker-compose.yml up  --build

down : 
	docker-compose -f ./srcs/docker-compose.yml down
status :
	docker ps
clean:
	docker volume rm -f `docker volume ls -q`
	docker rmi -f `docker image ls -q`
	docker   rm -f `docker ps -q`
