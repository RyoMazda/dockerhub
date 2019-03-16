FROM ryomazda/japaconda3:5.2.0

# install Python Libraries
#RUN pip install --upgrade pip && \
#    pip install \
#    lightgbm

ENV WORKDIR /work
WORKDIR $WORKDIR

COPY work/ $WORKDIR/

# for jupyter
COPY jupyter_notebook_config.py /root/.jupyter/
EXPOSE 8765
ENV PYTHONPATH=/work

CMD jupyter notebook