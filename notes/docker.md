# Docker Notes

## Pull and run image from Docker Hub

`docker run -it -d {IMAGE_NAME}`

## Accessing running container

`docker exec -it {CONTAINER_ID} bash`

## Building from Dockerfile

`docker build --tag="{USER}/{REPO}:{TAG}" .`

*or*

`docker build -t "{USER}/{REPO}:{TAG}" .`

Example: `docker build -t "jimde/repo:tag" .` from directory containing `Dockerfile`

## Committing Container to Image

`docker commit {CONTAINER_ID} {USER}/{REPO}`

## Pushing Image

`docker push {USER}/{REPO}`

## Other commands

`docker ps -a`

`docker images`

`docker stop {CONTAINER_ID}`

`docker start {CONTAINER_ID}`

`docker login`
