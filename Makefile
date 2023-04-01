
up:
	docker-compose up -d

down:
	docker-compose down

dev:
	docker exec -it network-proxy-dev /bin/bash

logs:
	docker logs -f network-proxy-dev

restart:
	make down && make up
