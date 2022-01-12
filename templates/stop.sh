#!/bin/bash

NAME=$1

if [[ -f "$2" ]]; then
    source $2
fi

/usr/local/bin/docker-compose down
