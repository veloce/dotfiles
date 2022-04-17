" Vincent Velociter - vimrc
call plug#begin(stdpath('data') . '/plugged')
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'rakr/vim-one'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'wavded/vim-stylus'
Plug 'dart-lang/dart-vim-plugin'
call plug#end()

let g:loaded_python_provider=0
let g:python3_host_prog="/usr/local/bin/python3"

source ~/.dotfiles/nvim/settings.vim
source ~/.dotfiles/nvim/plugins.vim
source ~/.dotfiles/nvim/commands.vim
source ~/.dotfiles/nvim/mappings.vim
source ~/.dotfiles/nvim/coc.vim
