launch:
	docker-compose -f docker-compose-dev.yml up

down:
	docker-compose -f docker-compose-dev.yml down

reset:
	docker stop $(docker ps -aq)
	docker rm $(docker ps -aq)

nuke-images:
	docker-compose -f docker-compose-dev.yml down --rmi all

db-dump:
	#docker exec -i gfb-docker-build_db_1 -uwordpress -pwordpress wordpress < ../db-dump/*.sql
	docker-compose -f docker-compose-dev.yml exec db bash -c 'cat ../db_dump/db177764_wp.sql | mysql -u$${MYSQL_USER} -p$${MYSQL_PASSWORD} $${MYSQL_DATABASE}'

db-console:
	docker-compose -f docker-compose-dev.yml exec mysql bash -c 'mysql -u$${MYSQL_USER} -p$${MYSQL_PASSWORD} $${MYSQL_DATABASE}'
