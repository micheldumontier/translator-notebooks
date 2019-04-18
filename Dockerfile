ARG BASE_CONTAINER=jupyter/tensorflow-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Michel Dumontier <michel.dumontier@gmail.com>"

USER root

RUN apt-get update \
  && apt-get install -y --no-install-recommends graphviz \
  && rm -rf /var/lib/apt/lists/* \
  && pip install --no-cache-dir pyparsing pydot

USER jovyan

RUN pip install sparqlkernel && jupyter sparqlkernel install --user

RUN pip install graphviz matplotlib

RUN jupyter labextension install @jupyterlab/hub-extension
