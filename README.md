## Test build local
The problem is here again we need to set the network and all that
So we can actually build the docker-compose file

- docker build -t backend -f ./docker/Dockerfile.backend .
- docker build -t websocket -f ./docker/Dockerfile.ws .
- docker build \
  --build-arg DATABASE_URL=postgresql://postgres:mypass@host.docker.internal:5435/postgres \
  --network=host \
  -t web -f ./docker/Dockerfile.frontend .


## Build the docker-compose.yml file
- docker-compose up
