FROM python:3.8.2-buster

# Install jupyter lab
RUN apt update && \
    apt -y install --fix-missing \
      # for jupyterlab extensions
      nodejs npm

RUN pip install 'jupyterlab<2.0.0'
# Unfortunately jupyterlab vim extension below does not support v2 yet.
# It's about to be supported: https://github.com/jwkvam/jupyterlab-vim/pull/115

# Install jupyterlab Extensions:
# - vim
#   https://github.com/jwkvam/jupyterlab-vim
RUN jupyter labextension install jupyterlab_vim


# For matplotlib Japanese font
RUN pip install \
    matplotlib

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
