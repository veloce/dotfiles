" Vincent Velociter - vimrc
call plug#begin(stdpath('data') . '/plugged')
Plug 'dart-lang/dart-vim-plugin'
Plug 'kana/vim-textobj-user'
Plug 'sgur/vim-textobj-parameter'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'for': ['typescript', 'dart'] }
Plug 'nvim-lua/plenary.nvim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'rakr/vim-one'
Plug 'scalameta/nvim-metals'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'vim-airline/vim-airline'
Plug 'wavded/vim-stylus'
call plug#end()

let g:loaded_python_provider=0
let g:python3_host_prog="/usr/local/bin/python3"

source ~/.dotfiles/nvim/settings.vim
source ~/.dotfiles/nvim/plugins.vim
source ~/.dotfiles/nvim/commands.vim
source ~/.dotfiles/nvim/mappings.vim
source ~/.dotfiles/nvim/coc.vim

lua require('lsp')
lua require('plugins.metals')
