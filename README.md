# Docker hub
Dockerfiles for the docker images pushed on https://hub.docker.com/u/ryomazda.

## Images
### jupyterlab
* python3.8.3 on slim-buster
* jupyterlab with vim extension
* matplotlib with Japanese fonts enabled

Usage
```sh
docker run --rm -it -p 8888:8888 -v $PWD:/work ryomazda/jupyterlab
```
The password is `password`.

Local build
```sh
docker build -t ryomazda/jupyterlab:local --target jupyterlab jupyterlab
```

### japaterlab
* Based on [jupyterlab](#jupyterlab)
* `mecab` & mecab-python3 & [neologd dictionary](https://github.com/neologd/mecab-ipadic-neologd) are installed
  * The default dictionary is `/var/lib/mecab/dic/debian` which is liked to `/var/lib/mecab/dic/ipadic-utf8`
  * You should specify the path to the dictionary when you run mecab or edit `/etc/mecabrc` to change dictionary
  * The neologd dictionaries are in `/opt/neologd` which is the latest at the time of the build and `/opt/neologd-0.0.6` which is for reproducibility.
* Usage is same as that of jupyterlab

### nlplab
* Based on [japaterlab](#japaterlab)
* Some NLP packages are pre-installed.


### jupyterlab_cuda
* based on the official pytorch image for cuda10.1 & cudnn7
  * python 3.7
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
