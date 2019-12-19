FROM python:3.7.5-buster

# Install jupyter lab
RUN apt update && apt -y upgrade && \
    apt -y install --fix-missing \
      # for jupyterlab extensions
      nodejs npm

RUN pip install --upgrade pip && \
    pip install \
      matplotlib \
      jupyterlab

# For matplotlib Japanese font
ENV PACKAGE_DIR /usr/local/lib/python3.7/site-packages
RUN curl -L "https://ipafont.ipa.go.jp/IPAexfont/IPAexfont00201.zip" > font.zip && \
    unzip font.zip && rm font.zip && \
    mv IPAexfont00201/ipaexg.ttf ${PACKAGE_DIR}/matplotlib/mpl-data/fonts/ttf/ipaexg.ttf && \
    rm -r IPAexfont00201
RUN echo "font.family : IPAexGothic" >>  ${PACKAGE_DIR}/matplotlib/mpl-data/matplotlibrc
RUN rm -r ~/.cache

# Install jupyterlab Extensions:
# - vim
#   https://github.com/jwkvam/jupyterlab-vim
RUN jupyter labextension install jupyterlab_vim

# Settings
COPY jupyter_notebook_config.py /root/.jupyter/
COPY overrides.json /usr/local/share/jupyter/lab/settings/

WORKDIR /work

CMD jupyter lab
