#!/bin/bash

TAG=18.12

# docker login
docker build . -t ryomazda/japaconda3:latest \
               -t ryomazda/japaconda3:${TAG}
docker push ryomazda/japaconda3:latest
docker push ryomazda/japaconda3:${TAG}