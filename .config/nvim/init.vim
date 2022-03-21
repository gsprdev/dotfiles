set runtimepath^=$XDG_CONFIG_HOME/vim runtimepath+=$XDG_CONFIG_HOME/vim/after
let &packpath = &runtimepath
source $XDG_CONFIG_HOME/vim/vimrc

if has("gui_vimr")
  set termguicolors
  "set background=dark
  set background=light
endif

