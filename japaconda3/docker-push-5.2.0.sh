#!/bin/bash

TAG=5.2.0

# docker login
docker build . -f Dockerfile_${TAG} -t ryomazda/japaconda3:${TAG}
docker push ryomazda/japaconda3:${TAG}
