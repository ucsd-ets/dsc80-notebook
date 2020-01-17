ARG BASE_CONTAINER=jupyter/datascience-notebook:7a0c7325e470
ARG DATAHUB_CONTAINER=ucsdets/datahub-base-notebook:2019.4.9

FROM $DATAHUB_CONTAINER as datahub

FROM $BASE_CONTAINER

MAINTAINER UC San Diego ITS/ETS-EdTech-Ecosystems <acms-compinf@ucsd.edu>
USER root

RUN pip install datascience

USER root

COPY --from=datahub /usr/share/datahub/scripts/* /usr/share/datahub/scripts/
RUN /usr/share/datahub/scripts/install-all.sh

# Install OKpy for DSC courses
RUN pip install okpy
RUN pip install dpkt

RUN conda install --quiet --yes \
            bokeh \
            cloudpickle \
            cython \
            dill \
            h5py \
            hdf5 \
            nose \
            numba \
            numexpr \
            patsy \
            scikit-image \
            scikit-learn \
            seaborn \
            sqlalchemy \
            sympy

# Pregenerate matplotlib cache
RUN python -c 'import matplotlib.pyplot'

#RUN conda remove --quiet --yes --force qt pyqt
RUN conda clean -tipsy

WORKDIR /home
RUN userdel jovyan && rm -rf /home/jovyan
ENV SHELL=/bin/bash

COPY start-systemuser.sh /usr/local/bin/start-systemuser.sh

RUN  bash -c 'find /opt/julia -type f -a -name "*.ji" -a \! -perm /005 | xargs chmod og+rX'

CMD ["sh" "/usr/local/bin/start-systemuser.sh"]
