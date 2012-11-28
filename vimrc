" Vincent Velociter - vimrc

set nocompatible                      " this should be the first

call pathogen#infect()

let g:feature_filetype='behat'

filetype indent plugin on
syntax on

set background=dark
set t_Co=256
let g:aldmeris_termcolors="tango"
colorscheme aldmeris

" OPTIONS {{{
" -----------
set backspace=indent,eol,start        " Allow backspacing over autoindent, line breaks and start of insert action
set completeopt=menuone,preview
set cmdheight=2                       " command bar height
set cursorline
set directory=~/.vim/tmp              " directory to put swap files
set encoding=utf-8
set hidden                            " Change buffer without saving
set history=100                       " nb of cmd history lines
set hlsearch                          " Highlight matches.
set ignorecase                        " Case-insensitive searching.
set incsearch                         " Highlight matches as you type.
set laststatus=2                      " always display status line
set nobackup                          " Don't make a backup before overwriting a file.
set nostartofline                     " Stop certain movements from always going to the first character of a line.
set nowritebackup
set number
set path+=**
set ruler
set scrolloff=5                       " context around cursor
set showcmd                           " Show partial commands in the last line of the screen
set showmode
set smartcase                         " case-sensitive search if expression contains a capital letter.
set statusline=%{fugitive#statusline()}
set statusline+=[%n]\ %f\ %h%m%r%w\ (%{(&fenc==\"\"?&enc:&enc)})(%{&ff}){%Y}[%L]\ %=%-16(\ %l,%c-%v\ %)%P
set tags+=vendor.tags
set wildignore=*/cache/*,*/logs/*,*/build/*,*.py[co],*.class,*.o,*.so,*.hi,tags,*/web/bundles,*/web/css,*/web/js,*/web/dashboard
set wildmenu                          " Better command-line completion
set wildmode=list:longest

" indent settings
set listchars=tab:▸\ ,eol:$
set autoindent
set expandtab
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4

" I have to set this here because of javascript bundle
autocmd FileType php setlocal iskeyword-=$

" }}}
" MAPPINGS {{{
" ------------
" easy switch for indent spaces
nmap <leader>2 :setlocal tabstop=2<cr>:setlocal shiftwidth=2<cr>:setlocal softtabstop=2<cr>
nmap <leader>4 :setlocal tabstop=4<cr>:setlocal shiftwidth=4<cr>:setlocal softtabstop=4<cr>

" indent whole file
nmap <leader>= <Esc>mygg=G`y

" launch help in vert mode split to the right window
nmap <Leader>h <Esc>:botright vert help<cr>:vert resize 80<cr>:help<space>

" Go to previous buffer
map <tab><tab> <C-^>

" Map Y to yank until EOL, rather than act as yy,
map Y y$

" clear search highlight
nnoremap <C-L> :nohl<CR><C-L>

" JSON indent mapping
vmap <leader>ij :!python -mjson.tool<CR>

" in current directory operations
nmap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
nmap <leader>rd :r <C-R>=expand("%:p:h") . "/" <CR>
nmap <leader>sa :saveas <C-R>=expand("%:p:h") . "/" <CR>
nmap <leader>rn :Rename <C-R>=expand("%:p:h") . "/" <CR>
nmap <leader>mk :!mkdir <C-R>=expand("%:p:h") . "/" <CR>
cnoremap %% <C-R>=expand("%:h")."/"<CR>

" Diff config
if &diff
    nmap <leader>do :diffget<space>
    nmap <leader>dp :diffput<space>
    nmap <leader>du :diffupdate<CR>
    nmap <leader>gl :diffget LOCAL<CR>
    nmap <leader>gr :diffget REMOTE<CR>
endif

" replace several times made easy
vmap <leader>p "0p

" Replace visual selection
vnoremap <C-r> y:%s/<C-R>=escape(@", '/\')<cr>/

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" convert char to htmlentity with php
nmap <C-h> ylvl"=system('php -r ' . shellescape("echo htmlentities('<C-R>"', ENT_COMPAT, 'UTF-8');"))<CR>p

" }}}
" PLUGINS SETTINGS {{{
" -------------------

" pydoc
let g:pydoc_open_cmd = 'vsplit'
let g:pydoc_highlight = 0

" pasta
let g:pasta_disabled_filetypes = ['python', 'coffee', 'yaml', 'haskell', 'behat']

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
" let g:neocomplcache_enable_cursor_hold_i = 1
" let g:neocomplcache_enable_insert_char_pre = 1
" let g:neocomplcache_min_syntax_length = 3
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.behat = '\(When\|Then\|Given\|And\)\s.*$'
if !exists('g:neocomplcache_same_filetype_lists')
  let g:neocomplcache_same_filetype_lists = {}
endif
let g:neocomplcache_same_filetype_lists.php = 'twig,htmljinja,behat,yaml,javascript'
let g:neocomplcache_same_filetype_lists.yaml = 'php'
let g:neocomplcache_same_filetype_lists.htmljinja = 'php,javascript,css'
let g:neocomplcache_same_filetype_lists.javascript = 'php'
let g:neocomplcache_same_filetype_lists.html = 'css,javascript'
let g:neocomplcache_same_filetype_lists.css = 'twig,html,htmljinja,javascript'
let g:neocomplcache_same_filetype_lists.gitcommit = '_'
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" syntastic options
let g:syntastic_enable_signs=1
let g:syntastic_enable_balloons=1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = { 'mode': 'active',
                            \ 'passive_filetypes': ['scala'] }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" command-t
let g:CommandTMaxHeight=20
let g:CommandTMaxFiles=30000

" Gundo
nnoremap <F5> :GundoToggle<CR>

" Fugitive
command! -complete=file -nargs=+ GGrep execute "silent! Ggrep" . <q-args> . " | copen | redraw!"
nmap <leader>g :GGrep '<C-R><C-W>'<CR>
vmap <leader>g y:GGrep '<C-R>"'<CR>
autocmd BufReadPost fugitive://* set bufhidden=delete

" Lusty
let g:LustyJugglerShowKeys = 0

" Ack
let g:ackprg="ack -a -H --nocolor --nogroup --column --ignore-dir=cache --ignore-dir=logs --ignore-dir=build"
nmap <leader>a :Ack '<C-R><C-W>'<CR>
vmap <leader>a y:Ack '<C-R>"'<CR>

" indents guides
let g:indent_guides_guide_size = 1

"}}}
" CUSTOM COMMANDS {{{
" -------------------

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
function! <SID>StripTWS()
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
command! StripTWS call <SID>StripTWS()
autocmd BufWritePre *.php,*.c,*.cpp,*.py,*.js,*.hs,*.scala,*.rb,*.twig,*.html,*.xml,*.css,*.vim,*.feature,*.md,*.markdown :call <SID>StripTWS()

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

" }}}

" vim:fdm=marker
