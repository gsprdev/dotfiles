set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

if has("gui_vimr")
  set termguicolors
  "set background=dark
  set background=light
endif

