all:
	sudo docker compose -p inception -f docker-compose.yml up --detach --build
clean:
	docker rm -f $(docker ps -aq) ; docker rmi -f $(docker image ls -aq) ; docker volume rm $(docker volume ls -q) ; docker network rm  $(docker network ls -q)


	