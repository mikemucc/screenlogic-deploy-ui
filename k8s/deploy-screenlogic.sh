#!/bin/bash
echo This script should only be run on your Kubernetes controller

export API_IMAGE="michaelmucciarone/screenlogic-api:latest"
export UI_IMAGE="michaelmucciarone/screenlogic-ui:latest"
export CONFIGMAP_NAME="sl-configmap.yaml"
# SERVER_ADDRESS should be the fqdn or ip address of the server these will be running on

export SERVER_ADDRESS=""

docker pull $API_IMAGE
# docker pull $UI_IMAGE

# Attempt to find any local Screenlogics. This will only work on Linux, as --net=host doesn't work correctly on MacOS or Windows.
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export tempSL=$(docker run -it --rm --net=host michaelmucciarone/screenlogic-api:latest generate-configmap.js)
    echo Generating K8s ConfigMap
    echo $tempSL > $CONFIGMAP_NAME
else
    echo ERROR: This script only works on Linux. No configmaps created.
fi
