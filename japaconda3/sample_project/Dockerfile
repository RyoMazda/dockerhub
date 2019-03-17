FROM ryomazda/japaconda3:5.2.0

# install Python Libraries
RUN pip install --upgrade pip && \
    pip install \
    pytest

ENV WORKDIR /work
WORKDIR $WORKDIR

COPY work/ $WORKDIR/

# 辞書登録
RUN /usr/lib/mecab/mecab-dict-index \
    -d /usr/lib/x86_64-linux-gnu/mecab/dic/mecab-ipadic-neologd \
    -u mecab_user_dict/jargon.dic \
    -f utf-8 \
    -t utf-8 mecab_user_dict/jargon.csv
RUN echo "userdic = /work/mecab_user_dict/jargon.dic\n" >> /etc/mecabrc
RUN cat /etc/mecabrc

# for jupyter
COPY jupyter_notebook_config.py /root/.jupyter/
EXPOSE 8765
ENV PYTHONPATH=/work

CMD jupyter notebook