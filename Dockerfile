FROM python:3.12-bookworm

ENV DEBIAN_FRONTEND=noninteractive
ENV PIP_DISABLE_PIP_VERSION_CHECK=1
ENV PIP_NO_CACHE_DIR=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    ca-certificates \
    build-essential \
    procps \
    nodejs \
    npm \
    gdal-bin \
    libgdal-dev \
    sqlite3 \
    && rm -rf /var/lib/apt/lists/*

COPY requirements/ /tmp/requirements/

RUN python -m pip install -U pip setuptools wheel && \
    python -m pip install \
      -r /tmp/requirements/base.txt \
      -r /tmp/requirements/geo.txt \
      -r /tmp/requirements/dev.txt \
      -r /tmp/requirements/viz.txt

RUN npm install -g @openai/codex

WORKDIR /workspace
