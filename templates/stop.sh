#!/bin/bash

if [[ -f "$1" ]]; then
    source $1
fi

/usr/local/bin/docker-compose down