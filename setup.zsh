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

DOTFILES_DIR=${0:A:h}

# vim
echo "VIM >>>"
rsync -ah $DOTFILES_DIR/.vim/ ~/.vim/
if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
    echo "Vundle is not installed. Installing..."
    ensureDir ~/.vim/bundle/
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    echo "Vundle is installed. Pulling latest..."
    cd ~/.vim/bundle/Vundle.vim
    git pull
fi
symlinkFile $DOTFILES_DIR/.vimrc ~/.vimrc
echo "<<< VIM\n"

# zsh
echo "ZSH >>>"
if [ ! -f ~/.zsh/antigen.zsh ]; then
    echo "Downloading ZSH Antigen"
    ensureDir ~/.zsh/
    curl -L git.io/antigen > ~/.zsh/antigen.zsh
else
    echo "A copy of ZSH Antigen already exists. A new copy will not be downloaded."
fi
symlinkFile $DOTFILES_DIR/.zshrc ~/.zshrc
symlinkFile $DOTFILES_DIR/.zshenv ~/.zshenv
echo "<<< ZSH\n"

echo "General Symlinking >>>"
symlinkFile $DOTFILES_DIR/.ssh/known_hosts ~/.ssh/known_hosts
symlinkFile $DOTFILES_DIR/.gitconfig ~/.gitconfig
symlinkFile $DOTFILES_DIR/.tmux.conf ~/.tmux.conf
echo "<<< General Symlinking\n"

