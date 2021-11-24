FROM alpine
WORKDIR /root
RUN apk add --no-cache vim git zsh
COPY .bash_profile .vimrc .zshrc .zshenv .exports .gitconfig .gitignore_global ./
COPY .zshrc_simplified ./.zshrc
COPY .vim ./.vim/
COPY .zsh ./.zsh/
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
RUN vim +PluginInstall +qall
RUN /usr/bin/env zsh -c 'exit'
CMD ["/usr/bin/env", "zsh"]

