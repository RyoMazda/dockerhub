FROM python:3.7.7-slim-buster as jupyterlab
ENV PACKAGE_DIR /usr/local/lib/python3.7/site-packages

RUN apt update && apt install -y \
    curl \
    unzip \
    # For jupyterlab
    nodejs npm \
    && rm -rf /var/lib/apt/lists/*

# Install jupyter lab
RUN pip install 'jupyterlab<2.0.0'
# Unfortunately jupyterlab vim extension below does not support v2 yet.
# It's about to be supported: https://github.com/jwkvam/jupyterlab-vim/pull/115

# Install jupyterlab Extensions:
# - vim
#   https://github.com/jwkvam/jupyterlab-vim
RUN jupyter labextension install jupyterlab_vim


# For matplotlib Japanese font
RUN pip install matplotlib
RUN curl -L "https://ipafont.ipa.go.jp/IPAexfont/IPAexfont00201.zip" > font.zip && \
    unzip font.zip && rm font.zip && \
    mv IPAexfont00201/ipaexg.ttf ${PACKAGE_DIR}/matplotlib/mpl-data/fonts/ttf/ipaexg.ttf && \
    rm -r IPAexfont00201
RUN echo "font.family : IPAexGothic" >>  ${PACKAGE_DIR}/matplotlib/mpl-data/matplotlibrc
RUN rm -r ~/.cache

# Settings
COPY jupyter_notebook_config.py /root/.jupyter/
COPY overrides.json /usr/local/share/jupyter/lab/settings/

WORKDIR /work
ENV PYTHONPATH=/work

EXPOSE 8888
CMD jupyter lab


# --------------------------
# For Japanese NLP
# --------------------------
FROM jupyterlab as japaterlab

RUN apt update && apt install -y \
    mecab \
    mecab-ipadic-utf8 \
    libmecab-dev \
    git \
    swig \
    file \
    sudo \
  && rm -rf /var/lib/apt/lists/*

# MeCab NEologd
# https://github.com/neologd/mecab-ipadic-neologd
WORKDIR /opt
RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git && \
    cd mecab-ipadic-neologd && \
    ./bin/install-mecab-ipadic-neologd -n -y -a
# Configure dictionary for MeCab at /etc/mecabrc
ENV MECABRC="/etc/mecabrc"
RUN sed -i "s@/var/lib/mecab/dic/debian@/usr/lib/x86_64-linux-gnu/mecab/dic/mecab-ipadic-neologd@g" ${MECABRC}
WORKDIR /work

# https://pypi.org/project/mecab-python3/
RUN pip install mecab-python3


# --------------------------
# For NLP course
# --------------------------
FROM japaterlab as nlp_course

# Install Python Libraries
RUN pip install \
    pytest \
    pandas \
    torch \
    torchtext \
    transformers

# Pretrained Models
COPY jawiki.all_vectors.100d.txt.bz2 /pretrained_models/
COPY BERT-base_mecab-ipadic-bpe-32k_whole-word-mask /pretrained_models/BERT-base_mecab-ipadic-bpe-32k_whole-word-mask
