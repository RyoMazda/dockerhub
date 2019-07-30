#!/bin/bash

TAG=2019.07

# docker login
docker build . -f Dockerfile_${TAG} \
               -t ryomazda/japaconda3:${TAG} \
               -t ryomazda/japaconda3:latest
docker push ryomazda/japaconda3:${TAG}
docker push ryomazda/japaconda3:latest
