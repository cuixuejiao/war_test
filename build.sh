#!/bin/bash

# build docker images
IMAGE=$(docker build . | tail -1 | awk '{ print $NF }')

# mount dir
MNT="$WORKSPACE/.."

# build in contaner
CONTAINER=$(docker run -d -v "$MNT:/opt/project" $IMAGE /bin/bash -c 'cd /opt/projec/workspace && gradle build')

# build result
docker attach $CONTAINER

# wait for exit
RC=$(docker wait $CONTAINER)

# delete container we just used
docker rm $CONTAINER

# exit
exit $RC
