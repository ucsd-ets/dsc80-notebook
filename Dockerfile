FROM ucsdets/datascience-notebook:2023.2-stable

USER root

RUN conda install -c conda-forge python=3.8

COPY requirements.txt /tmp

RUN pip install -r /tmp/requirements.txt

USER $NB_UID
