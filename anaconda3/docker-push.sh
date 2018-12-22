#!/bin/bash

TAG=5.3.0

# docker login
docker build . -t ryomazda/anaconda3:latest \
               -t ryomazda/anaconda3:${TAG}
docker push ryomazda/anaconda3:latest
docker push ryomazda/anaconda3:${TAG}