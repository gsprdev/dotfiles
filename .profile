
if [ ! -d "$XDG_CONFIG_HOME" ]; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi
if [ ! -d "$XDG_CACHE_HOME" ]; then
    export XDG_CACHE_HOME="$HOME/.cache"
fi
if [ ! -d "$XDG_DATA_HOME" ]; then
    export XDG_DATA_HOME="$HOME/.local/share"
fi

export VIMINIT="set nocp | source ${XDG_CONFIG_HOME:-$HOME/.config}/vim/vimrc"

source ~/.functions

ensuredir $XDG_CONFIG_HOME -m 0700
ensuredir $XDG_CACHE_HOME -m 0700
ensuredir $XDG_DATA_HOME -m 0700
ensuredir $XDG_DATA_HOME/vim/view -m 0700
ensuredir $XDG_DATA_HOME/vim/spell -m 0700
ensuredir $XDG_CACHE_HOME/vim/backup -m 0700
ensuredir $XDG_CACHE_HOME/vim/swap -m 0700
ensuredir $XDG_CACHE_HOME/vim/undo -m 0700

for file in ~/.{path,bash_prompt,exports,aliases,functions,final}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
