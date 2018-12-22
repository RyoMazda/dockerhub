FROM ubuntu:18.04

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install \
    build-essential \
    libssl-dev \
    libffi-dev\
    vim \
    sudo \
    wget \
    git \
    unzip \
    htop

# install anaconda
RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-5.3.0-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh

# notebook extensions + jupyter-vim-binding
RUN pip install --upgrade pip && \
    pip install \
    msgpack \
    jupyter_contrib_nbextensions && \
    jupyter contrib nbextensions install --user && \
    mkdir -p $(jupyter --data-dir)/nbextensions && \
    cd $(jupyter --data-dir)/nbextensions && \
    git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
# turn on jupyter vim_binding
RUN jupyter nbextension enable vim_binding/vim_binding
