#!/usr/bin/env sh

if [ ! -d "$XDG_CONFIG_HOME" ]; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi
if [ ! -d "$XDG_CACHE_HOME" ]; then
    export XDG_CACHE_HOME="$HOME/.cache"
fi
if [ ! -d "$XDG_DATA_HOME" ]; then
    export XDG_DATA_HOME="$HOME/.local/share"
fi