all:
	@make setup_volumes
	@make up

setup_volumes:
	@sudo mkdir -p /home/nde-koni/data/mariadb /home/nde-koni/data/wordpress

stop_host_services:
	@sudo service nginx stop
	@sudo service mysql stop

up:
	@(cd srcs; docker-compose up --build)

upd:
	@(cd srcs; docker-compose up -d --build)

updebug:
	@(cd srcs; docker-compose --verbose up --build)

down:
	@(cd srcs; docker-compose down)

fclean:
	@docker rmi -f `docker images -q`

vclean:
	@docker volume rm -f srcs_db_volume srcs_wp_volume
	@sudo rm -rf /home/nde-koni/data/mariadb/* /home/nde-koni/data/wordpress/*