.PHONE: install-docker install-acme start check-env start stop reset-explorer delete-state reset all

check-env:
	export CHAIN_ID=99
#ifndef DOMAIN_NAME
#	$(warning env DOMAIN_NAME is undefined)
#endif
#ifndef CHAIN_ID
#	$(error env CHAIN_ID is undefined)
#endif

install-docker:
	bash ./scripts/install-docker.bash

install-acme:
	curl https://get.acme.sh | sh -s email=dmitry@ankr.com || true
	bash ./scripts/issue-cert.bash

start: check-env
	cat ./docker-compose.yaml | envsubst | docker-compose -f - pull
	cat ./docker-compose.yaml | envsubst | docker-compose -f - up -d

stop:
	docker compose stop

reset-explorer: check-env stop
	docker compose stop
	rm -rf ./datadir/blockscout
	cat ./docker-compose.yaml | envsubst | docker-compose -f - up -d

delete-state:
	rm -rf ./datadir

reset: stop delete-state start

all: start