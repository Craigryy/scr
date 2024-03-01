# scripturesandpower

## Requirement

- python environment (I made use of pyenv to set my environment.)
- poetry
- docker
- docker-compose
- git

## Setup

Project makes use of [Poetry](https://python-poetry.org/) for python packaging and dependency management.

Install `poetry` within a [pyenv](https://github.com/pyenv/pyenv-virtualenv) controlled python version

```shell
pip install poetry
poetry install

poetry show
poetry env info
```

## Local Run

```shell
SQLITE=True poetry run script/manage.py makemigrations
SQLITE=True poetry run script/manage.py migrate
SQLITE=True poetry run script/manage.py runserver
```


## Using Docker

```shell
# Navigate to "script.docker.localhost"
# after running the command below

docker-compose up
```

## Using Makefile

```shell
#Start the development server 

make sqlite-run 
```

```shell
#Stop the Docker containers

make stop
```

```shell
#Stop and remove the Docker containers and associated volumes

make teardown
```

```shell
#View the Docker network

make network
```

```shell
#Start the Docker app

make start
```

```shell
#Build Docker container

make build 
```


```shell
#flake8 linter 

make py-flake
```

```shell
#autopep8  file 

make py-auto
```

### PS: 

Dependecy update should also be applied to requirements.txt using the `update_requirement_file.sh` script.# scr
