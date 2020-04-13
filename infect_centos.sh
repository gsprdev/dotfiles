#!/usr/bin/env bash

set -e
set -o pipefail

function configure() {
    # Ask for the administrator password upfront
    sudo -v

    # Keep-alive: update existing `sudo` time stamp until this script has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    # Install required software
    sudo yum -y install git

    # Clone the dotfiles
    cd ~/
    git clone https://github.com/gspreder/dotfiles.git

    cd dotfiles
    ./centos.sh
}

configure

