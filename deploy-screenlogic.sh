#!/bin/bash
# Clean out any old containers
docker-compose down
# SERVER_ADDRESS should be the fqdn or ip address of the server these will be running on
# The docker-compose file will run both containers on the same machine on different ports
export SERVER_ADDRESS=""

export API_IMAGE="michaelmucciarone/screenlogic-api:latest"
export UI_IMAGE="michaelmucciarone/screenlogic-ui:latest"



docker pull $API_IMAGE
docker pull $UI_IMAGE

# Attempt to find any local Screenlogics. This will only work on Linux, as --net=host doesn't work correctly on MacOS or Windows.
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export tempSL=$(docker run -it --rm --net=host michaelmucciarone/screenlogic-api:latest find-sl.js)
    echo Screenlogic found at $tempSL
    export SL_IP_ADDRESS=$(echo $tempSL | cut -d ':' -f 1)
    export SL_PORT=$(echo $tempSL | cut -d ':' -f 2)
else
    echo ScreenLogic not auto-detected on Network. Using specified configuration.
    export SL_IP_ADDRESS="" # IP Address of Screenlogic.
    export SL_PORT="80" # Port the ScreenLogic is running on. This is usually port 80
fi


docker-compose up -d