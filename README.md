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
docker run --gpus all --rm -it -p 80:8888 -v $PWD:/work ryomazda/jupyterlab_cuda
# or japaterlab
docker run --gpus all --rm -it -p 80:8888 -v $PWD:/work ryomazda/japaterlab_cuda
```
The password is `password`.

See [this](how_to_use_gcp_instance_with_gpu.md) as an example usage with GCP.

Local build
```sh
docker build \
  -t ryomazda/jupyterlab_cuda:local \
  -f jupyterlab/Dockerfile_cuda \
  --target jupyterlab \
  jupyterlab

# japaterlab
docker build \
  -t ryomazda/japaterlab_cuda:local \
  -f jupyterlab/Dockerfile_cuda \
  --target japaterlab \
  jupyterlab
```
