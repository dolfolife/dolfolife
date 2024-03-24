FROM python:3.9.10-slim-buster

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
  software-properties-common \
  vim \
  wget \
  build-essential \
  curl \
  alien \
  libaio1 \
  libaio-dev \
  libxrender1 \
  libfontconfig1 \
  rpm2cpio \
  cpio \
  unzip \
  libsasl2-dev \
  libldap2-dev \
  libssl-dev

ENV PYTHONUNBUFFERED 1
ENV DEBIAN_FRONTEND noninteractive

RUN wget -qO- https://yihui.name/gh/tinytex/tools/install-unx.sh | sh
RUN mkdir /src
RUN rm -rf /src/TinyTeX
RUN mv /root/.TinyTeX /src/TinyTeX
RUN ln -s /src/TinyTeX/bin/x86_64-linux/pdflatex /usr/local/bin/pdflatex
RUN ln -s /src/TinyTeX/bin/x86_64-linux/tlmgr /usr/local/bin/tlmgr
# TODO this list is prob way too long and I have dependencies I do not need, so I need to clean this
RUN /src/TinyTeX/bin/x86_64-linux/tlmgr path add \
    && /src/TinyTeX/bin/x86_64-linux/tlmgr install \
        accsupp \
        adjustbox \
        amsfonts \
        amsmath \
        auxhook \
        biber \
        biblatex \
        biblatex-apa6 \
        catchfile \
        changepage \
        cm-super \
        cmap \
        collectbox \
        colorprofiles \
        dashrule \
        enumitem \
        environ \
        extsizes \
        fancyhdr \
        fancyvrb \
        float \
        fontawesome5 \
        fontaxes \
        fourier \
        fouriernc \
        fvextra \
        geometry \
        gettitlestring \
        hyperref \
        hyphenat \
        ifmtarg \
        ifplatform \
        koma-script \
        kvoptions \
        lastpage \
        lato \
        lineno \
        minted \
        ms \
        multirow \
        ncntrsbk \
        paracol \
        parskip \
        pdfx \
        pgf \
        pgfplots \
        psnfss \
        ragged2e \
        rerunfilecheck \
        roboto \
        textpos \
        url \
        xcolor \
        xmpincl \
        xstring

RUN pip install pygments


WORKDIR /resume
VOLUME ["/resume"]
# Default command
CMD ["/bin/sh"]
