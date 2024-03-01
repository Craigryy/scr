# Variables
# Mark all targets as phony
.PHONY: sqlite-run stop teardown network navigate start build help py-flake py-auto start-detach
.DEFAULT_GOAL := help

DOCKER_COMPOSE = docker-compose
NETWORK_NAME = scripturesandpower

ifeq ($(shell uname), Linux)
    # This is a Linux system
    BROWSER := xdg-open
else
    # This is not a Linux system (e.g., macOS, Windows)
    BROWSER := open
endif


# Flake8 linting
py-flake: ## Run Flake8 linter
	flake8 script

# Autopep8 formatting
py-auto: ## Run autopep8 formatter
	autopep8 -r script --in-place

# Stop containers
stop: ## Stop the Docker containers
	$(DOCKER_COMPOSE) stop

# Teardown app
teardown: ## Stop and remove the Docker containers and associated volumes
	$(DOCKER_COMPOSE) down -v

# View Docker network
network: ## View the Docker network
	@docker network inspect $(NETWORK_NAME)

# Navigate to script.docker.localhost
navigate: ## Navigate to script.docker.localhost
	@echo "Navigating to script.docker.localhost..."
	$(BROWSER) "http://script.docker.localhost"  # This opens the URL in the default web browser

# Start Docker app
start: ## Start the Docker app
	$(DOCKER_COMPOSE) up 

start-detach: ## Start the Docker app
	$(DOCKER_COMPOSE) up -d


# Build Docker containers
build: ## Build Docker containers
	$(DOCKER_COMPOSE) build

# Local Development server
sqlite-run: ## Start the Django development server using sqlite3
	SQLITE=True poetry run script/manage.py makemigrations
	SQLITE=True poetry run script/manage.py migrate
	SQLITE=True poetry run script/manage.py runserver

# Help command
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'