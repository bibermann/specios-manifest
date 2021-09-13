#!/usr/bin/env bash
set -euo pipefail

Rscript -e 'rmarkdown::render_site(output_format = "bookdown::bs4_book", encoding = "UTF-8")'
