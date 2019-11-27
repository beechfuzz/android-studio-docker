#!/bin/bash

###
### VARIABLES
###

SCRIPT_NAME="$(basename ${BASH_SOURCE[0]})"
CONTAINER="beechfuzz-android-studio"

#Get full pathname to this script
#---------------------------------
pushd . > /dev/null
SCRIPT_PATH="${BASH_SOURCE[0]}"
while([ -h "${SCRIPT_PATH}" ]); do
    cd "$(dirname "${SCRIPT_PATH}")"
    SCRIPT_PATH="$(readlink "$(basename "${SCRIPT_PATH}")")"
done
cd "$(dirname "${SCRIPT_PATH}")" > /dev/null
SCRIPT_PATH="$(pwd)/$(basename ${BASH_SOURCE[0]})"
popd  > /dev/null


###
### MAIN
###

#Run docker container
#--------------------
if ! (sudo docker ps -a --format '{{.Names}}' | grep -q "$CONTAINER"); then
	echo "INFO: Creating Docker container '$CONTAINER'."
	docker container create --name="$CONTAINER" \
		--net=host \
		-v "$HOME/.Xauthority:/root/.Xauthority:rw" \
	    -e DISPLAY="$DISPLAY" \
	    beechfuzz/android-studio-docker
fi
echo "INFO: Starting '$CONTAINER'."
docker start -i $CONTAINER &

