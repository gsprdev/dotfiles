#!/usr/bin/env zsh

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
        ensureDir $(dirname $2)
        ln -sfv $1 $2
    fi
}

DOTFILES_DIR=${0:A:h}

git submodule init
git submodule update

# vim
rsync -ah $DOTFILES_DIR/.vim/ ~/.vim/
symlinkDir $DOTFILES_DIR/submodules/vundle ~/.vim/bundle/Vundle.vim
symlinkFile $DOTFILES_DIR/.vimrc ~/.vimrc

# zsh
symlinkFile $DOTFILES_DIR/submodules/antigen/antigen.zsh ~/.zsh/antigen.zsh
symlinkFile $DOTFILES_DIR/.zshrc ~/.zshrc
symlinkFile $DOTFILES_DIR/.zshenv ~/.zshenv

# Others
symlinkFile $DOTFILES_DIR/.ssh/known_hosts ~/.ssh/known_hosts
symlinkFile $DOTFILES_DIR/.gitconfig ~/.gitconfig
symlinkFile $DOTFILES_DIR/.tmux.conf ~/.tmux.conf

