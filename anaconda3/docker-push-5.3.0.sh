#!/bin/bash

TAG=5.3.0

# docker login
docker build . -f Dockerfile_5.3.0 \
               -t ryomazda/anaconda3:${TAG} \
               -t ryomazda/anaconda3:latest
docker push ryomazda/anaconda3:${TAG}
docker push ryomazda/anaconda3:latest
