all : up

up :
	sudo mkdir -p /Users/mariedarbois/data/mysql
	sudo mkdir -p /Users/mariedarbois/data/wordpress
	sudo docker-compose -f ./srcs/docker-compose.yml up -d --build
#-d detach mode: will build it in the background
#up: if the images are ready it will run them inside the container, otherwise it will build them
#--build: rebuild everytime we relaunch the app

down :
	sudo docker-compose -f ./srcs/docker-compose.yml down -v
	sudo rm -rf Users/mariedarbois/data/mysql
	sudo rm -rf Users/mariedarbois/data/wordpress
#down: stop and remove the containers but the images are still there
# -v removes any volumes associated with the containers being stopped and removed
stop :
	sudo docker-compose -f ./srcs/docker-compose.yml stop

start :
	sudo docker-compose -f ./srcs/docker-compose.yml start

status :
	sudo docker ps

clean: down
	sudo docker system prune -af
#	sudo docker container rm -f $$(sudo docker container ls -a -q);\
#	sudo docker image rm -f $$(sudo docker image ls -q);\
#	sudo docker volume rm $$(sudo docker volume ls -q);\
#	sudo docker network rm $$(sudo docker network ls -q)

re: clean up


.PHONY: all up down stop start status clean re
