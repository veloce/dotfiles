" Vincent Velociter
" Special vimrc to launch vim for git commit as I don't like to wait ;)
syntax on

set background=dark

set nobackup
set nowritebackup
set noswapfile

set number
set laststatus=2
set statusline=[%n]\ %f\ %h%m%r%w\ (%{(&fenc==\"\"?&enc:&enc)})(%{&ff}){%Y}[%L]\ %=%-16(\ %l,%c-%v\ %)%P

map! jk 
map! kj 
