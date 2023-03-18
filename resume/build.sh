#!/bin/sh

docker build --no-cache -t dolfolife/latex:$(cat ./VERSION) .

# TODO why  do  ineed to run pdflatex twice
# Double to procress refs
docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$PWD":/resume dolfolife/latex:$(cat ./VERSION) /bin/sh -c "pdflatex resume.tex && pdflatex resume.tex"
