#!/bin/bash

NAME=$1

if [[ -f "$2" ]]; then
    source $2
fi

echo "Service name: $NAME"

## Remove old containers, images and volumes
if [ "$REMOVE_VOLUMES" = true ]; then
    /usr/local/bin/docker-compose down -v
else
    ## Remove old containers
    /usr/local/bin/docker-compose down
fi

## Remove any anonymous volumes attached to containers
## By default, anonymous volumes attached to containers are not removed. 
## You can override this with -v.
/usr/local/bin/docker-compose rm -fv

## Remove named volumes
if [ "$REMOVE_VOLUMES" = true ]; then
    /bin/bash -c 'docker volumes ls -qf "name='$NAME'_" | xargs docker volume rm'
fi

if [ "$REMOVE_NETWORK" = true ]; then
    /bin/bash -c 'docker network ls -qf "name='$NAME'_" | xargs docker network rm'
fi

OLD_CONTAINERS=$(docker ps -aqf "name=$NAME_*" | wc -l)

if [ "$OLD_CONTAINERS" -gt "0" ]; then
    /bin/bash -c 'docker ps -aqf "name='$NAME'_*" | xargs docker rm'
fi
