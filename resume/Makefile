DOCKER = docker run --rm -i --user="$(shell id -u):$(shell id -g)" --net=none \
         -v "$(shell pwd)":/resume dolfolife/latex:0.0.3

.PHONY: eu us all

eu:
	$(DOCKER) /bin/sh -c \
	  "pdflatex -jobname=resume-eu '\\def\\EUVERSION{1}\\input{resume}' && \
	   pdflatex -jobname=resume-eu '\\def\\EUVERSION{1}\\input{resume}'"

us:
	$(DOCKER) /bin/sh -c \
	  "pdflatex -jobname=resume-us '\\input{resume}' && \
	   pdflatex -jobname=resume-us '\\input{resume}'"

all: eu us
