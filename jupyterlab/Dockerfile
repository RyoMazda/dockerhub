FROM python:3.7.5-buster

# Install jupyter lab
RUN apt update && apt -y upgrade && \
    apt -y install --fix-missing \
      # for jupyter lab extensions
      nodejs npm

RUN pip install --upgrade pip && \
    pip install \
      jupyterlab

# Extensions
# vim
# https://github.com/jwkvam/jupyterlab-vim
RUN jupyter labextension install jupyterlab_vim

# Settings
COPY jupyter_notebook_config.py /root/.jupyter/
COPY overrides.json /usr/local/share/jupyter/lab/settings/

WORKDIR /work

CMD jupyter lab
