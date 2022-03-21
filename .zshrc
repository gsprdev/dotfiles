# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

if [[ -f $(which nvim) ]]; then
	export VISUAL=nvim
	export EDITOR=nvim
else
	export VISUAL=vim
	export EDITOR=vim
fi

source ~/.zsh/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle gitfast
antigen bundle git-flow
#antigen bundle history #vi-mode is probably better
antigen bundle vi-mode
antigen bundle gradle

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
#antigen theme robbyrussell
#antigen theme fox
#antigen theme af-magic
#antigen theme gallois
antigen theme gnzh

# Tell Antigen that you're done.
antigen apply

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
if [ -d "$HOME/.sdkman" ]; then
	export SDKMAN_DIR="$HOME/.sdkman"
	[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

