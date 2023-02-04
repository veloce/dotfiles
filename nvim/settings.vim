set termguicolors
let g:one_allow_italics = 1
colorscheme one
set background=dark

set autoread
set backspace=indent,eol,start        " Allow backspacing over autoindent, line breaks and start of insert action
set clipboard=unnamed
set cmdheight=2                       " command bar height
set colorcolumn=80
set completeopt=menuone,preview
set cursorline
set encoding=utf-8
set hidden                            " Change buffer without saving
set history=900                       " nb of cmd history lines
set hlsearch                          " Highlight matches.
set ignorecase                        " Case-insensitive searching.
set incsearch                         " Highlight matches as you type.
set laststatus=2                      " always display status line
set nobackup                          " Don't make a backup before overwriting a file.
set nowritebackup
set noswapfile
set nostartofline                     " Stop certain movements from always going to the first character of a line.
set number
set ruler
set scrolloff=5                       " context around cursor
set showcmd                           " Show partial commands in the last line of the screen
set showmode
set smartcase                         " case-sensitive search if expression contains a capital letter.
" set statusline+=[%n]\ %f\ %h%m%r%w\ (%{(&fenc==\"\"?&enc:&enc)})(%{&ff}){%Y}[%L]\ %=%-16(\ %l,%c-%v\ %)%P
" set statusline=%{fugitive#statusline()}
set tags+=vendor.tags
set wildignore=.git,*.py[co],*.class,*.obj,*.o,*.so,*.hi,tags,*/cache*/*,*/logs/*,*/target*/*,*/dist/*,*/node_modules/*,*/build/*,*/i18n/*,*/locale/*,*/compiled/*,*/public/*
set wildmenu                          " Better command-line completion
set wildmode=list:full

" indent settings
set listchars=tab:▸\ ,eol:$
set autoindent
set expandtab
set smartindent
set shiftround
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab

" automatically open quickfix window after any grep
autocmd QuickFixCmdPost *grep* cwindow

" conf ext not properly detected
au BufNewFile,BufRead *.conf set filetype=conf
