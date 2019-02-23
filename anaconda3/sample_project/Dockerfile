FROM ryomazda/anaconda3:5.2.0

# install Python Libraries
RUN pip install --upgrade pip && \
    pip install \
    tqdm

ENV WORKDIR /work
WORKDIR $WORKDIR

COPY work/ $WORKDIR/

# for jupyter
COPY jupyter_notebook_config.py /root/.jupyter/
EXPOSE 8765
ENV PYTHONPATH=/work

# turn on jupyter vim_binding extension if you like
# RUN jupyter nbextension enable vim_binding/vim_binding

CMD jupyter notebook
