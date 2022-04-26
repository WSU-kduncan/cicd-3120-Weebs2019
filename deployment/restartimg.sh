#!/bin/sh

# stop current container
docker stop activeWebserv
# remove current container
docker rm activeWebserv
#delete docker image
#docker image rm Weebs2019/firstrepo:latest
# pull new image
docker pull Weebs2019/firstrepo:latest
# run new image in container
docker run -d --name activeWebserv -p 80:80 Weebs2019/firstrepo:latest

© 2022 GitHub, Inc.
Terms
Privacy
Security
