FROM python:3.12-bookworm

ENV DEBIAN_FRONTEND=noninteractive
ENV PIP_DISABLE_PIP_VERSION_CHECK=1
ENV PIP_NO_CACHE_DIR=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    procps \
    htop \
    tree \
    unzip \
    git \
    curl \
    ca-certificates \
    build-essential \
    nodejs \
    npm \
    gdal-bin \
    libgdal-dev \
    sqlite3 \
    && rm -rf /var/lib/apt/lists/*

RUN python -m pip install -U pip setuptools wheel

# Scientific / geospatial stack
RUN python -m pip install \
    numpy \
    pandas \
    scipy \
    matplotlib \
    plotly \
    folium \
    branca \
    mapclassify \
    ipywidgets \
    geopandas \
    shapely \
    pyogrio \
    rasterio \
    fiona \
    pyproj \
    xarray \
    rioxarray \
    netcdf4 \
    h5netcdf \
    pyarrow \
    openpyxl \
    sqlalchemy

# Dev / testing / config tooling
RUN python -m pip install \
    pyyaml \
    tomli \
    pytest \
    pytest-cov \
    pytest-mock \
    hypothesis \
    ruff \
    black \
    isort \
    mypy \
    pre-commit \
    ipython \
    ipykernel \
    jupyterlab \
    rich \
    typer \
    click \
    tqdm \
    loguru \
    python-dotenv

RUN npm install -g @openai/codex

RUN useradd -m -s /bin/bash geodev

USER geodev
WORKDIR /workspace
