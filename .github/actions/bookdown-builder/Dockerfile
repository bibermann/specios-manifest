FROM r-base:4.1.1

LABEL "com.github.actions.name"="Bookdown Builder"

RUN apt-get update && apt-get install --no-install-recommends -y \
        pandoc \
        libxml2-dev \
        pandoc-citeproc \
        && \
    rm -rf /var/lib/apt/lists/*

RUN Rscript -e 'install.packages(c( \
        "rmarkdown", \
        "bookdown", \
        "bslib", \
        "downlit", \
        "xml2", \
        "reticulate", \
        ""))'

RUN Rscript -e 'reticulate::install_miniconda(path = "/usr/local")'

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
