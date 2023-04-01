
up:
	docker compose up -d

down:
	docker compose down

dev:
	docker exec -it network-proxy /bin/bash

logs:
	docker logs -f network-proxy

restart:
	make down && make up
