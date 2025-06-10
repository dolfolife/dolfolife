# Build your resume in LaTeX

## Pre-requisities

**Docker Engine**: We run a docker container with all dependencies to build the `.tex` file.

## Usage

I have a built image of the [Dockerfile](./Dockerfile) at [dolfolife/latex](https://hub.docker.com/r/dolfolife/latex) that you can use at any time like

```sh
docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "[FOLDER_WITH_THE_TEX_FILE]":/resume \
  dolfolife/latex:0.0.2 /bin/sh -c "pdflatex file.tex && pdflatex file.tex"
```

_note: the dependencies I install in the Dockerfile layers are specific for my needs of my resume. If you need more dependencies you can extend or copy the Dockerfile to add those._

## Contributing

Contributions are always welcome. More often than not I will have some `TODO` statements in the code for things I need help with.

[![Docker Image CI](https://github.com/dolfolife/dolfolife/actions/workflows/docker-image.yml/badge.svg)](https://github.com/dolfolife/dolfolife/actions/workflows/docker-image.yml)
