# Docker hub
Dockerfiles for the docker images pushed on https://hub.docker.com/u/ryomazda.

## Images
### jupyterlab
* python3.7.7 on slim-buster
* jupyterlab with vim extension
* matplotlib with Japanese fonts enabled

Usage
```sh
docker run --rm -it -p 8888:8888 -v $PWD:/work ryomazda/jupyterlab
```
The password is `password`.

Local build
```sh
cd jupyterlab
docker build -t ryomazda/jupyterlab:local --target jupyterlab .
```

### japaterlab
* based on [jupyterlab](#jupyterlab)
* `mecab` with [neologd dictionary](https://github.com/neologd/mecab-ipadic-neologd)
* mecab-python3 is installed

Local build
```sh
cd jupyterlab
docker build -t ryomazda/japaterlab:local --target japaterlab .
```

### jupyterlab_cuda
* based on the official pytorch image for cuda10.1 & cudnn7
* jupyterlab with vim extension
* matplotlib with Japanese fonts enabled

Usage
```sh
docker run --rm -it -p 8888:8888 -v $PWD:/work ryomazda/jupyterlab_cuda
```
The password is `password`.

Local build
```sh
cd jupyterlab
docker build -t ryomazda/jupyterlab_cuda:local --target jupyterlab_cuda .
# japaterlab_cuda
docker build -t ryomazda/japaterlab_cuda:local --target japaterlab .
```
