# Docker hub
Dockerfiles for the docker images pushed on https://hub.docker.com/u/ryomazda.

## Images
### jupyterlab
* python3.7 on debian (buster)
* matplotlib with Japanese fonts enabled
* jupyterlab with vim settings

### Usage
```bash
docker run --rm -it -p 8888:8888 -v $PWD:/work ryomazda/jupyterlab
# Go to localhost:8888 through your browser and type "password" as password
```

---
I will abandon images below.

### anaconda3
* Japanese fonts enabled for matplotlib
* vim extension

### japaconda3
* Based on `anaconda3`
* mecab & mecab-python
* neologd
