#!/bin/bash

if [[ -f "$1" ]]; then
    source $1
fi

echo "Service name: $2"

## Remove old containers, images and volumes
if [ "$REMOVE_VOLUMES" = true ]; then
    /usr/local/bin/docker-compose down -v
else
    ## Remove old containers
    /usr/local/bin/docker-compose down
fi

## Remove any anonymous volumes attached to containers
/usr/local/bin/docker-compose rm -fv

## Remove named volumes
if [ "$REMOVE_VOLUMES" = true ]; then
    /bin/bash -c 'docker volumes ls -qf "name='$2'_" | xargs docker volume rm'
fi

if [ "$REMOVE_NETWORK" = true ]; then
    /bin/bash -c 'docker network ls -qf "name='$2'_" | xargs docker network rm'
fi

/bin/bash -c 'docker ps -aqf "name='$2'_*" | xargs docker rm'
