all : up

up :
	sudo mkdir -p /home/mdarbois/data/mysql
	sudo mkdir -p /home/mdarbois/data/wordpress
	sudo docker compose -f ./srcs/docker-compose.yml up -d --build

down : 
	sudo docker compose -f ./srcs/docker-compose.yml down
	sudo rm -rf /home/mdarbois/data/mysql
	sudo rm -rf /home/mdarbois/data/wordpress

stop : 
	sudo docker compose -f ./srcs/docker-compose.yml stop

start : 
	sudo docker compose -f ./srcs/docker-compose.yml start

status : 
	sudo docker ps
	
clean:
	sudo docker stop $$(sudo docker ps -qa);\
	sudo docker rm $$(sudo docker ps -qa);\
	sudo docker rmi -f $$(sudo docker images -qa);\
	sudo docker volume rm $$(sudo docker volume ls -q);\
	sudo docker network rm $$(sudo docker network ls -q)
	sudo rm -rf /home/mdarbois/data/mysql
	sudo rm -rf /home/mdarbois/data/wordpress

re: clean all


.PHONY: all re down clean
