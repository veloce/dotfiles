call plug#begin(stdpath('data') . '/plugged-gitcommit')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
call plug#end()

syntax on

colorscheme desert256
set background=dark

set nobackup
set nowritebackup
set noswapfile

set laststatus=2
set statusline=[%n]\ %f\ %h%m%r%w\ (%{(&fenc==\"\"?&enc:&enc)})(%{&ff}){%Y}[%L]\ %=%-16(\ %l,%c-%v\ %)%P

set omnifunc=rhubarb#Complete
set completeopt-=preview
