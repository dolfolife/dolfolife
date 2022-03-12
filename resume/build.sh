#!/bin/sh
docker build --no-cache -t dolfo/latex:$(cat ./VERSION) .

# Double to procress refs
docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$PWD":/resume dolfo/latex:$(cat ./VERSION) /bin/sh -c "pdflatex resume.tex && pdflatex resume.tex"
