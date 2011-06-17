" Vincent Velociter - vimrc

set nocompatible                      " this should be the first

call pathogen#infect()
call pathogen#helptags()

filetype indent plugin on
syntax on

set background=dark
set t_Co=256
let g:aldmeris_termcolors="tango"
colorscheme aldmeris

set encoding=utf-8

set history=100                       " nb of cmd history lines
set hidden                            " Change buffer without saving
set wildmenu                          " Better command-line completion 
set wildmode=list:longest             
set wildignore+=*/cache/**,*/logs/**,*.pyc

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

set nostartofline                     " Stop certain movements from always going to the first character of a line.

set backspace=indent,eol,start        " Allow backspacing over autoindent, line breaks and start of insert action

" indent settings
set autoindent
set expandtab
set smartindent

set tabstop=4
set shiftwidth=4
set softtabstop=4

" Try an mapping to leave insert mode
imap jk <ESC>

" special indent settings
au BufNewFile,BufRead *.class.php setlocal tabstop=2 shiftwidth=2 softtabstop=2

" easy switch for indent spaces
nmap <leader>2 :setlocal tabstop=2<cr>:setlocal shiftwidth=2<cr>:setlocal softtabstop=2<cr>
nmap <leader>4 :setlocal tabstop=4<cr>:setlocal shiftwidth=4<cr>:setlocal softtabstop=4<cr>

" indent whole file
nmap <leader>= <Esc>mygg=G`y

" launch help in vert mode split to the right window
nmap <leader>h :botright vert help 

" Diff config
if &diff
    nmap <leader>do :diffget<space>
    nmap <leader>dp :diffput<space>
    nmap <leader>gl :diffget LOCAL<CR>
    nmap <leader>gr :diffget REMOTE<CR>
endif

" supertab
"let g:SuperTabDefaultCompletionType = context
let g:SuperTabLeadingSpaceCompletion = 0

" syntastic options
let g:syntastic_enable_signs=1
" let g:syntastic_auto_loc_list = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Faster viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Go to previous buffer
map <leader>\ <C-^>

" Map Y to yank until EOL, rather than act as yy,
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" edit, read, save as or rename files in the current directory of the buffer
nmap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
nmap <leader>rd :r <C-R>=expand("%:p:h") . "/" <CR>
nmap <leader>sa :saveas <C-R>=expand("%:p:h") . "/" <CR>
nmap <leader>rn :Rename <C-R>=expand("%:p:h") . "/" <CR>

" Fugitive
map <leader>g :silent Ggrep <C-R><C-W><CR>:copen<CR>
autocmd BufReadPost fugitive://* set bufhidden=delete

" Lusty
let g:LustyJugglerShowKeys = 0

" Ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column --ignore-dir=cache --ignore-dir=logs --ignore-dir=base --ignore-dir=vendor"
nmap <leader>a :Ack <C-R><C-W><CR>

" CommandT
let g:CommandTMaxFiles = 30000

" indents guides
let g:indent_guides_guide_size = 1

" snipMate
let g:snips_author = "Vincent Velociter"

" Processing results in quickfix http://efiquest.org/2009-02-19/32/
com! -nargs=1 Qfdo try | sil cfirst |
\ while 1 | exec <q-args> | sil cn | endwhile |
\ catch /^Vim\%((\a\+)\)\=:E\%(553\|42\):/ |
\ endtry
com! -nargs=1 Qfdofile try | sil cfirst |
\ while 1 | exec <q-args> | sil cnf | endwhile |
\ catch /^Vim\%((\a\+)\)\=:E\%(553\|42\):/ |
\ endtry

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
autocmd BufWritePre *.php,*.c,*.cpp,*.py,*.js,*.twig,*.html,*.xml,*.css :call <SID>StripTrailingWhitespaces()

" Show syntax highlighting groups for word under cursor
nnoremap <F8> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Show differences between buffer and saved versions of a file
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" solarized toggle background function
call togglebg#map("<F4>")

" convert char to htmlentity with php
nmap <C-h> ylvl"=system('php -r ' . shellescape("echo htmlentities('<C-R>"', ENT_COMPAT, 'UTF-8');"))<CR>p

" a simple macro to re-generate id entries in messages.xml files
let @r='f=ll"tyi"%jf=lvi""tp^'
