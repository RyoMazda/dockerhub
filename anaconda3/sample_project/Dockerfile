FROM ryomazda/anaconda3:2019.07

# install Python Libraries
RUN pip install --upgrade pip && \
    pip install \
    tqdm

ENV WORKDIR /work
WORKDIR $WORKDIR

COPY work/ $WORKDIR/

# for jupyter
COPY jupyter_notebook_config.py /root/.jupyter/
EXPOSE 8888
ENV PYTHONPATH=/work

# turn on jupyter vim_binding extension if you like
# RUN jupyter nbextension enable vim_binding/vim_binding

CMD jupyter notebook
