#!/usr/bin/env bash

set -e
set -o pipefail

function configure() {
    # Ask for the administrator password upfront
    sudo -v

    # Keep-alive: update existing `sudo` time stamp until this script has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    # Install required software
    sudo apt-get -y install vim git zsh tmux xclip rsync

    # Use ZSH
    sudo chsh -s $(which zsh) $(whoami)

    ./setup.zsh
}

configure

