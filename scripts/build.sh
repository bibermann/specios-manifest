#!/usr/bin/env bash
set -euo pipefail

COLOR_LIGHT_CYAN='\033[1;36m'
COLOR_LIGHT_RED='\033[1;31m'
COLOR_YELLOW='\033[1;33m'
COLOR_GREEN='\033[0;32m'
COLOR_NO='\e[0m'

unset image
unset container
function finish {
    if [ $? -eq 0 ]; then
        echo -e "${COLOR_GREEN}Success.${COLOR_NO} Cleaning up..."
    else
        echo -e "${COLOR_LIGHT_RED}Failed.${COLOR_NO} Cleaning up..."
    fi

    if [ ! -z ${container+x} ]; then
        sudo docker stop $container
        sudo docker rm $container
    fi
    if [ ! -z ${image+x} ]; then
        sudo docker rmi $image
    fi
}
trap finish EXIT

root=$(git rev-parse --show-toplevel)
cd $root

rm -rf dist

pushd .github/actions/bookdown-builder
    sudo docker build -t specios-bookdown .
popd

image=specios-bookdown-app
sudo docker build -t $image -f scripts/Dockerfile .
container=$(sudo docker create --user docker $image)
echo -e "${COLOR_LIGHT_CYAN}Building book...${COLOR_NO}"
sudo docker start --attach $container
sudo docker cp $container:/app/_book dist
sudo chown -R $USER:$USER dist
