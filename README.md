# pygeodev

A Python 3.12 development image for geospatial, data, notebook, and CLI work. It bundles GDAL system libraries, common scientific Python packages, JupyterLab, testing and formatting tools, and the OpenAI Codex CLI.

## What's Included

- Python 3.12 on Debian Bookworm
- GDAL, Fiona, Rasterio, GeoPandas, Shapely, PyProj, Pyogrio
- NumPy, pandas, SciPy, PyArrow, Xarray, SQLAlchemy
- Matplotlib, Plotly, Folium, ipywidgets
- pytest, ruff, black, isort, mypy, pre-commit
- JupyterLab, IPython, Rich, Typer, Click, tqdm, Loguru
- Node.js, npm, and `@openai/codex`

Dependencies are grouped in [`requirements/`](requirements/) so the image contents are easy to review and adjust.

## Use The Image

```bash
docker pull gisflw/pygeodev:py312
docker run --rm -it -v "$PWD:/workspace" -w /workspace gisflw/pygeodev:py312 bash
```

Run JupyterLab from a project directory:

```bash
docker run --rm -it \
  -p 8888:8888 \
  -v "$PWD:/workspace" \
  -w /workspace \
  gisflw/pygeodev:py312 \
  jupyter lab --ip=0.0.0.0 --allow-root
```

## Build Locally

```bash
docker build -t geodev:py312 .
docker run --rm -it -v "$PWD:/workspace" geodev:py312
```

## Devcontainer Example

For VSCode development.

Copy [`examples/devcontainer`](examples/devcontainer/) into a project as `.devcontainer/`, then adjust `postCreateCommand` for that project's extras.

The example uses this image as a base and bind-mounts the project into `/workspace`.

## Layout

```text
pygeodev/
├── Dockerfile
├── README.md
├── .dockerignore
├── .gitignore
├── requirements/
│   ├── base.txt
│   ├── geo.txt
│   ├── dev.txt
│   └── viz.txt
└── examples/
    └── devcontainer/
        ├── Dockerfile
        └── devcontainer.json
```
