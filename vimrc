" Vincent Velociter - vimrc

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible
filetype indent plugin on
syntax on

set t_Co=256
colorscheme aldmeris256

set encoding=utf-8

set history=50                        " Remember 50 lines of cmd history
set hidden                            " Change buffer without saving
set wildmenu                          " Better command-line completion 
set wildmode=list:longest             
set wildignore+=*/cache/**,*/logs/**

set ignorecase                        " Case-insensitive searching.
set smartcase                         " But case-sensitive if expression contains a capital letter.
set incsearch                         " Highlight matches as you type.
set hlsearch                          " Highlight matches.

set nobackup                          " Don't make a backup before overwriting a file.
set nowritebackup
set directory=~/.vim/tmp              " directory to put swap files

set ruler
set cursorline
set scrolloff=5                       " context around cursor
set laststatus=2                      " always display status line
set statusline=[%n]\ %f\ %h%m%r%w\ (%{(&fenc==\"\"?&enc:&enc)})(%{&ff}){%Y}[%L]\ %=%-16(\ %l,%c-%v\ %)%P
set showcmd                           " Show partial commands in the last line of the screen
set showmode
set cmdheight=2                       " command bar height
set number

set gdefault                          " Always replace all occurences of a line
set nostartofline                     " Stop certain movements from always going to the first character of a line.

set backspace=indent,eol,start        " Allow backspacing over autoindent, line breaks and start of insert action

" indent settings
set autoindent
set expandtab
set smartindent

set tabstop=4
set shiftwidth=4
set softtabstop=4

" special indent settings
au BufNewFile,BufRead *.class.php setlocal tabstop=2 shiftwidth=2 softtabstop=2

" easy switch for indent spaces
nmap <leader>2 :set tabstop=2<cr>:set shiftwidth=2<cr>:set softtabstop=2<cr>
nmap <leader>4 :set tabstop=4<cr>:set shiftwidth=4<cr>:set softtabstop=4<cr>

" indent whole file
nmap <leader>= <Esc>mygg=G'y

" launch help in vert mode
nmap <leader>h :vert help 

" Strip trailing whitespaces
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTWS call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.php,*.c,*.py,*.js,*.twig,*.html,*.xml,*.css :call <SID>StripTrailingWhitespaces()

" Diff config
if &diff
    nmap <leader>do :diffget<space>
    nmap <leader>dp :diffput<space>
endif

" supertab
"let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLeadingSpaceCompletion = 0

" syntastic options
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Show syntax highlighting groups for word under cursor
" see vimcast.org/episodes/creating-colorschemes-for-vim/
nnoremap <C-F8> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Lusty
map <leader>lp :LustyJugglePrevious<cr>
let g:LustyJugglerShowKeys = 0

" Faster viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" CTAGS 
nnoremap <silent> <C-F7> :silent !ctags-exuberant -h ".php" --PHP-kinds="+cf" --recurse --exclude="*/cache/*" --exclude="*/logs/*" --exclude="*/data/*" --exclude="\.git" --exclude="\.svn" --languages="PHP"<cr>

" taglist plugin
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "name"

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" open files in the same directory as the current file (see vimcasts.org)
nmap <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
nmap <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" read files in the same directory as the current file
nmap <leader>rw :r <C-R>=expand("%:p:h") . "/" <CR>

" ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column --type-add html=twig --ignore-dir=cache --ignore-dir=logs"

" CommandT
let g:CommandTMaxFiles = 30000  " Increase cache size
