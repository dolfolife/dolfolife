FROM python:3.11-slim-bookworm

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

ENV PYTHONUNBUFFERED=1
ENV DEBIAN_FRONTEND=noninteractive

RUN echo "Installing TinyTeX..." && \
    wget -qO- https://yihui.name/gh/tinytex/tools/install-unx.sh | sh || \
    if [ -d "/tmp/texlive" ] || [ -d "$HOME/.TinyTeX" ] || [ -d "$HOME/texlive" ]; then \
        echo "TinyTeX installation completed (ignoring mirror sync warning)"; \
        exit 0; \
    else \
        echo "TinyTeX installation failed"; \
        exit 1; \
    fi && \
    echo "TinyTeX installation completed successfully"
RUN mkdir -p /src
RUN echo "Moving TinyTeX to /src..." && \
    (mv /root/.TinyTeX /src/TinyTeX || mv /root/texlive /src/TinyTeX || mv /tmp/texlive /src/TinyTeX) && \
    echo "TinyTeX moved successfully" && \
    ls -la /src/TinyTeX && \
    echo "Checking bin directory..." && \
    ls -la /src/TinyTeX/bin/

# Update tlmgr first and set repository
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "aarch64" ]; then TEXARCH="aarch64-linux"; \
    elif [ "$ARCH" = "x86_64" ]; then TEXARCH="x86_64-linux"; \
    else TEXARCH="x86_64-linux"; fi && \
    echo "Setting CTAN repository..." && \
    /src/TinyTeX/bin/$TEXARCH/tlmgr option repository https://mirrors.rit.edu/CTAN/systems/texlive/tlnet && \
    echo "Updating tlmgr..." && \
    /src/TinyTeX/bin/$TEXARCH/tlmgr update --self --all || \
    (echo "tlmgr update had issues, attempting to continue..." && exit 0) && \
    echo "tlmgr update completed"

# Install LaTeX engine before creating symlinks
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "aarch64" ]; then TEXARCH="aarch64-linux"; \
    elif [ "$ARCH" = "x86_64" ]; then TEXARCH="x86_64-linux"; \
    else TEXARCH="x86_64-linux"; fi && \
    echo "Installing LaTeX engine (pdfTeX) for $TEXARCH..." && \
    /src/TinyTeX/bin/$TEXARCH/tlmgr install latex-bin tex latex && \
    echo "LaTeX engine installed" && \
    ls -la /src/TinyTeX/bin/$TEXARCH/ | grep -E "pdflatex|latex"

# Detect architecture and create symlinks
RUN ARCH=$(uname -m) && \
    echo "Detected architecture: $ARCH" && \
    if [ "$ARCH" = "aarch64" ]; then TEXARCH="aarch64-linux"; \
    elif [ "$ARCH" = "x86_64" ]; then TEXARCH="x86_64-linux"; \
    else TEXARCH="x86_64-linux"; fi && \
    echo "Using TeX architecture: $TEXARCH" && \
    echo "Checking if binaries exist..." && \
    ls -la /src/TinyTeX/bin/$TEXARCH/ && \
    if [ ! -f /src/TinyTeX/bin/$TEXARCH/pdflatex ]; then \
        echo "ERROR: pdflatex not found at /src/TinyTeX/bin/$TEXARCH/pdflatex"; \
        echo "Available architectures:"; \
        ls -la /src/TinyTeX/bin/; \
        exit 1; \
    fi && \
    echo "Creating symlinks..." && \
    ln -s /src/TinyTeX/bin/$TEXARCH/pdflatex /usr/local/bin/pdflatex && \
    ln -s /src/TinyTeX/bin/$TEXARCH/tlmgr /usr/local/bin/tlmgr && \
    ln -s /src/TinyTeX/bin/$TEXARCH /usr/local/bin/texlive-bin && \
    echo "Symlinks created successfully" && \
    which pdflatex && \
    pdflatex --version

# Add tlmgr to PATH
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "aarch64" ]; then TEXARCH="aarch64-linux"; \
    elif [ "$ARCH" = "x86_64" ]; then TEXARCH="x86_64-linux"; \
    else TEXARCH="x86_64-linux"; fi && \
    echo "Adding tlmgr to PATH..." && \
    /src/TinyTeX/bin/$TEXARCH/tlmgr path add && \
    echo "PATH updated"

# TODO this list is prob way too long and I have dependencies I do not need, so I need to clean this
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "aarch64" ]; then TEXARCH="aarch64-linux"; \
    elif [ "$ARCH" = "x86_64" ]; then TEXARCH="x86_64-linux"; \
    else TEXARCH="x86_64-linux"; fi && \
    echo "Installing LaTeX packages for $TEXARCH architecture..." && \
    (/src/TinyTeX/bin/$TEXARCH/tlmgr install \
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
        ec \
        collectbox \
        colorprofiles \
        dashrule \
        enumitem \
        environ \
        everyshi \
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
        l3packages \
        lastpage \
        lato \
        lineno \
        minted \
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
        tcolorbox \
        tikzfill \
        url \
        xcolor \
        xmpincl \
        xstring || echo "Some packages may have had mirror sync warnings, continuing...") && \
    echo "LaTeX packages installed successfully"

RUN pip install pygments && echo "Python pygments installed successfully"


WORKDIR /resume
VOLUME ["/resume"]
# Default command
CMD ["/bin/sh"]
