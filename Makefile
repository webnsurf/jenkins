.PHONY: default
default:
	@echo Tasks:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)


.PHONY:
run: ## Start Jenkins docker containers
	@export DOCKER_PATH=$$(which docker) && \
	export DOCKER_COMPOSE_PATH=$$(which docker-compose) && \
	docker-compose up -d


.PHONY:
stop: ## Stop Jenkins docker containers
	@export DOCKER_PATH=$$(which docker) && \
	export DOCKER_COMPOSE_PATH=$$(which docker-compose) && \
	docker-compose stop

	
.PHONY:
restart: stop run ## Restart Jenkins docker containers


.PHONY:
clean: ## Stop and remove Jenkins docker containers and images
	@export DOCKER_PATH=$$(which docker) && \
	export DOCKER_COMPOSE_PATH=$$(which docker-compose) && \
	docker-compose down && docker image rm webnsurf-jenkins || true
