#!/bin/bash

TAG=2019.07

# docker login
docker build . -f Dockerfile_2019.07 \
               -t ryomazda/anaconda3:${TAG} \
               -t ryomazda/anaconda3:latest
docker push ryomazda/anaconda3:${TAG}
docker push ryomazda/anaconda3:latest
