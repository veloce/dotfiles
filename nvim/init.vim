" Vincent Velociter - vimrc
call plug#begin(stdpath('data') . '/plugged')
Plug 'akinsho/flutter-tools.nvim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'kana/vim-textobj-user'
Plug 'leafgarland/typescript-vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-tree/nvim-web-devicons'
Plug 'peitalin/vim-jsx-typescript'
Plug 'scalameta/nvim-metals'
Plug 'sgur/vim-textobj-parameter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'wavded/vim-stylus'
call plug#end()

let g:loaded_python_provider=0
let g:python3_host_prog="/usr/local/bin/python3"

source ~/.dotfiles/nvim/settings.vim
source ~/.dotfiles/nvim/plugins.vim
source ~/.dotfiles/nvim/commands.vim
source ~/.dotfiles/nvim/mappings.vim

lua << EOF
  require('colorscheme')
  require('lsp')
  require('plugins.flutter')
  require('plugins.lualine')
  require('plugins.metals')
  require('plugins.telescope')
EOF
