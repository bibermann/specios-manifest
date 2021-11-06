#!/usr/bin/env bash
set -euo pipefail

root=$(git rev-parse --show-toplevel)
cd $root

sudo docker rmi specios-bookdown

rm -rf _book
rm -rf _bookdown_files
rm -rf dist
rm -f specios-manifest.rds
