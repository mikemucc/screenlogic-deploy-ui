#!/bin/bash

export tempSL=$(docker run -it --rm --net=host michaelmucciarone/screenlogic-api:latest find-sl.js)

echo Screenlogic found at $tempSL
export SL_IP_ADDRESS=$(echo $tempSL | cut -d ':' -f 1)
export SL_PORT=$(echo $tempSL | cut -d ':' -f 2)

docker-compose up -d
