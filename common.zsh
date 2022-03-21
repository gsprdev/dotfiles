#!/usr/bin/env/zsh

if [ ! -d "$XDG_CONFIG_HOME" ]; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi
if [ ! -d "$XDG_CACHE_HOME" ]; then
    export XDG_CACHE_HOME="$HOME/.cache"
fi
if [ ! -d "$XDG_DATA_HOME" ]; then
    export XDG_DATA_HOME="$HOME/.local/share"
fi

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


