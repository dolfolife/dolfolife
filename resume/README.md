# Resume Builder

I made these files to build a LaTex file to pdf using [AltaCV](https://github.com/liantze/AltaCV) class. Kudos to [liantze](https://github.com/liantze) for making this class.

There is no real reason, yet, why building my resume using LaTex with [TinyTeX](https://yihui.org/tinytex/), but it was fun to remember college times when LaTeX was the default format for our assignments.

## Pre-requisities

**Docker Engine**: We run a docker container with all dependencies to build the tex file.

## Build

If you want to copy how this resume is built. Copy this folder, update the [Resume Tex file](./resume.tex). Then you can run

```sh
./build.sh
```

## Contributing

Contributions are always welcome. More often than not I will have some `TODO` statements in the code for things I need help with.

[![Docker Image CI](https://github.com/dolfolife/dolfolife/actions/workflows/docker-image.yml/badge.svg)](https://github.com/dolfolife/dolfolife/actions/workflows/docker-image.yml)
