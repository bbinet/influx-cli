#!/bin/bash

DOCKER_OPTIONS="--rm -i"
CFG="${1:-$HOME/.influxrc}"
CFGPATH=$(readlink -f "$CFG")

if [ -f "$CFGPATH" ]
then
    # add volume to influx-cli config file
    DOCKER_OPTIONS="$DOCKER_OPTIONS -v $CFGPATH:/root/.influxrc"
else
    >&2 echo "Cannot find influx-cli config file: $CFGPATH"
fi

if [[ -t 0 ]]
then
    # stdin is coming from the terminal
    DOCKER_OPTIONS="$DOCKER_OPTIONS -t"
fi

docker run $DOCKER_OPTIONS dieterbe/influx-cli
