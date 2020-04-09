# Docker hub
Dockerfiles for the docker images pushed on https://hub.docker.com/u/ryomazda.

## Images
### jupyterlab
* python3.8.2 on debian (buster)
* jupyterlab with vim extension
* matplotlib with Japanese fonts enabled

#### Usage
```bash
docker run --rm -it -p 8888:8888 -v $PWD:/work ryomazda/jupyterlab
```
The password is `password`.
