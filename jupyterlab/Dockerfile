FROM python:3.8.3-slim-buster as jupyterlab

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
ENV PACKAGE_DIR /usr/local/lib/python3.8/site-packages
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
# Install from the release since we want reproducibility
RUN curl -L "https://github.com/neologd/mecab-ipadic-neologd/archive/v0.0.6.zip"  --output neologd006.zip && \
    unzip neologd006.zip && rm neologd006.zip && \
    cd mecab-ipadic-neologd-0.0.6 && \
        mkdir /opt/neologd-0.0.6 && \
        ./bin/install-mecab-ipadic-neologd -n -y -a -p /opt/neologd-0.0.6 && \
        cd .. && \
    rm -rf mecab-ipadic-neologd-0.0.6
# Install the latest version as well
RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git && \
    cd mecab-ipadic-neologd && \
        mkdir /opt/neologd && \
        ./bin/install-mecab-ipadic-neologd -n -y -a -p /opt/neologd && \
         cd .. && \
    rm -rf mecab-ipadic-neologd
WORKDIR /work

# https://pypi.org/project/mecab-python3/
RUN pip install unidic-lite mecab-python3
