FROM python:3.8.5-slim-buster as base

RUN apt-get update && apt-get install -y \
    mecab \
    mecab-ipadic-utf8 \
    libmecab-dev \
    git \
    make \
    curl \
    xz-utils \
    file \
  && rm -rf /var/lib/apt/lists/*

# https://pypi.org/project/mecab-python3/
RUN pip install unidic-lite mecab-python3


FROM base as main
# MeCab NEologd
# https://github.com/neologd/mecab-ipadic-neologd
WORKDIR /opt
# Install the latest version as well
RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git && \
    cd mecab-ipadic-neologd && \
        mkdir /opt/neologd && \
        ./bin/install-mecab-ipadic-neologd -n -y -a -p /opt/neologd && \
         cd .. && \
    rm -rf mecab-ipadic-neologd
WORKDIR /work


FROM base as fix
WORKDIR /opt
# Install from the release since we want reproducibility
RUN apt-get update && apt-get install -y \
    unzip \
  && rm -rf /var/lib/apt/lists/* && \
  curl -L "https://github.com/neologd/mecab-ipadic-neologd/archive/v0.0.6.zip"  --output neologd006.zip && \
    unzip neologd006.zip && rm neologd006.zip && \
    cd mecab-ipadic-neologd-0.0.6 && \
        mkdir /opt/neologd-0.0.6 && \
        ./bin/install-mecab-ipadic-neologd -n -y -a -p /opt/neologd-0.0.6 && \
        cd .. && \
    rm -rf mecab-ipadic-neologd-0.0.6
WORKDIR /work
