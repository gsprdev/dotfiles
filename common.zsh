#!/usr/bin/env/zsh

ensureDir () {
    if [ ! -d $1 ]; then
        mkdir -p $1
    fi
}

symlinkFile () {
    if [ -f $1 ]; then
        ensureDir $(dirname $2)
        ln -sfv $1 $2
    fi
}

symlinkDir () {
    if [ -d $1 ]; then
        if [ ! -d $2 ]; then
            ensureDir $(dirname $2)
            ln -sfv $1 $2
        fi
    fi
}


