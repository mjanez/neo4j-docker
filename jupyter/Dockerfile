ARG JUPYTER_TAG
FROM quay.io/jupyter/scipy-notebook:${JUPYTER_TAG}

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    graphviz \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

USER ${NB_UID}

COPY --chown=${NB_UID}:${NB_GID} jupyter/setup/requirements.txt /tmp/

RUN pip install --quiet --no-cache-dir -r /tmp/requirements.txt

RUN python -m spacy download en_core_web_sm

# Optional
# RUN jupyter labextension install ... 