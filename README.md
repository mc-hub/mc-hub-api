# Mchub

**TODO: Add description**

## Development Environment

```bash
# build the containers.
docker-compose build

# fetch dependencies
docker-compose run app mix deps.get

# create database
docker-compose run --rm app mix ecto.create
docker-compose run --rm app mix ecto.migrate

# run the app
docker-compose up
```

