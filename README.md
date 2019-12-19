# Docker hub
Dockerfiles for the docker images pushed on https://hub.docker.com/u/ryomazda.

There are also sample projects that use the docker images.

## Images
### jupyterlab
```bash
cd jupyterlab
docker build -t ryomazda/jupyterlab . && \
  docker run --rm -it -p 8888:8888 -v $PWD:/work ryomazda/jupyterlab
# Go to localhost:8888 through your browser and type "password" as password
```
