#!/bin/bash

TAG=5.2.0

# docker login
docker build . -f Dockerfile-python3-6 -t ryomazda/anaconda3:${TAG}
docker push ryomazda/anaconda3:${TAG}
