all : up

up :
	sudo mkdir -p /home/mdarbois/data/mariadb
	sudo mkdir -p /home/mdarbois/data/wordpress
	sudo docker-compose -f ./srcs/docker-compose.yml up -d
#-d detach mode: will build it in the background
#up: if the images are ready it will run them inside the container, otherwise it will build them
#--build: rebuild everytime we relaunch the app

down :
	sudo docker-compose -f ./srcs/docker-compose.yml down -v
#down: stop and remove the containers but the images are still there
# -v removes any volumes associated with the containers being stopped and removed
stop :
	sudo docker-compose -f ./srcs/docker-compose.yml stop

status :
	sudo docker ps

clean: down
	sudo docker system prune -af

fclean: clean
# sudo docker stop $$(sudo docker ps -qa)
	sudo rm -rf /home/mdarbois/data/mariadb
	sudo rm -rf /home/mdarbois/data/wordpress
	sudo docker network prune --force
	sudo docker volume prune --force
	sudo docker system prune --all --force --volumes

re: clean up


.PHONY: all up down stop start status clean fclean re
