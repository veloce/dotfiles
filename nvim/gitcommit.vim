call plug#begin(stdpath('data') . '/plugged-gitcommit')
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
call plug#end()

syntax on

set nobackup
set nowritebackup
set noswapfile

set laststatus=2
set statusline=[%n]\ %f\ %h%m%r%w\ (%{(&fenc==\"\"?&enc:&enc)})(%{&ff}){%Y}[%L]\ %=%-16(\ %l,%c-%v\ %)%P

set omnifunc=rhubarb#Complete
set completeopt-=preview

lua << EOF
  require('colorscheme')
EOF
