#!/usr/bin/env zsh

set -e
#setopt verbose

DOTFILES_DIR=${0:A:h}

source ./common.zsh

git submodule init
git submodule update

# vim
symlinkDir $DOTFILES_DIR/submodules/vundle $XDG_CONFIG_HOME/vim/bundle/Vundle.vim

# sh-family shells
symlinkFile $DOTFILES_DIR/.aliases ~/.aliases
symlinkFile $DOTFILES_DIR/.functions ~/.functions
symlinkFile $DOTFILES_DIR/.profile ~/.profile
symlinkFile $DOTFILES_DIR/submodules/antigen/antigen.zsh ~/.zsh/antigen.zsh
symlinkFile $DOTFILES_DIR/.zshrc ~/.zshrc
symlinkFile $DOTFILES_DIR/.zshenv ~/.zshenv
symlinkFile $DOTFILES_DIR/.zprofile ~/.zprofile
symlinkFile $DOTFILES_DIR/.exports ~/.exports
symlinkFile $DOTFILES_DIR/.final ~/.final

# Create placeholder standard commit message, if not already existing
if [[ ! -f  ~/.stCommitMsg ]]; then
    touch ~/.stCommitMsg
fi

# .config
symlinkDir $DOTFILES_DIR/.config $XDG_CONFIG_HOME

# Others
if [ -f ~/.ssh/known_hosts ]; then
    MERGEFILE=/tmp/known_hosts_merged
    cat ~/.ssh/known_hosts $DOTFILES_DIR/.ssh/known_hosts | sort -u >$MERGEFILE
    cp ~/.ssh/known_hosts{,.bak}
    cp $MERGEFILE $DOTFILES_DIR/.ssh/known_hosts
fi
symlinkFile $DOTFILES_DIR/.ssh/known_hosts ~/.ssh/known_hosts
symlinkFile $DOTFILES_DIR/.bash_profile ~/.bash_profile
symlinkFile $DOTFILES_DIR/.tmux.conf ~/.tmux.conf

# Install VIM plugins
vim -c ":VundleInstall" -c ":qa"

