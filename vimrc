" Vincent Velociter - vimrc

set nocompatible                      " this should be the first

call pathogen#infect()

let g:feature_filetype='behat'

filetype indent plugin on
syntax on

set t_Co=256
set background=dark
let g:solarized_menu=0
colorscheme solarized

" OPTIONS {{{
" -----------
set autoread
set backspace=indent,eol,start        " Allow backspacing over autoindent, line breaks and start of insert action
set clipboard=unnamed
set cmdheight=2                       " command bar height
set colorcolumn=80
set completeopt=menuone,preview
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
set ruler
set scrolloff=5                       " context around cursor
set showcmd                           " Show partial commands in the last line of the screen
set showmode
set smartcase                         " case-sensitive search if expression contains a capital letter.
set statusline+=[%n]\ %f\ %h%m%r%w\ (%{(&fenc==\"\"?&enc:&enc)})(%{&ff}){%Y}[%L]\ %=%-16(\ %l,%c-%v\ %)%P
set statusline=%{fugitive#statusline()}
set tags+=vendor.tags
set wildignore=.git,*.py[co],*.class,*.obj,*.o,*.so,*.hi,tags,**/cache*/*,**/logs/*,**/target*/*,**/dist/*,**/node_modules/*,**/build/*,**/i18n/*,**/locale/*,**/compiled/*
set wildmenu                          " Better command-line completion
set wildmode=list:longest

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

" I have to set this here because of javascript bundle
autocmd FileType php setlocal iskeyword-=$

" automatically open quickfix window after any grep
autocmd QuickFixCmdPost *grep* cwindow

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

" toggle folds
nnoremap <space> za

" clear search highlight
nnoremap <C-L> :nohl<CR><C-L>

" JSON indent mapping
vmap <leader>ij :!python -mjson.tool<CR>

" align to first : char (useful for json)
vmap <C-a> :Tab /^[^:]*:\zs
cmap <C-a> Tab /^[^:]*:\zs

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

" Trigger a whole replace from visual selection
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

" perform a vimgrep with last search
nmap <leader>vg :vimgrep /<C-R>// `git ls-files`<CR>:cw<CR>

" }}}
" PLUGINS SETTINGS {{{
" -------------------

" airline
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'

" closetag
let g:closetag_filenames = "*.html,*.xml"

" raindow parenthesis
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
let g:rbpt_colorpairs = [
      \ ['brown',       'RoyalBlue3'],
      \ ['Darkblue',    'SeaGreen3'],
      \ ['darkgray',    'DarkOrchid3'],
      \ ['darkgreen',   'firebrick3'],
      \ ['darkcyan',    'RoyalBlue3'],
      \ ['darkred',     'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['brown',       'firebrick3'],
      \ ['gray',        'RoyalBlue3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['Darkblue',    'firebrick3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['darkcyan',    'SeaGreen3'],
      \ ['darkred',     'DarkOrchid3'],
      \ ['red',         'firebrick3'],
      \ ]

au Syntax *.clj,*.cljs RainbowParenthesesLoadRound
au Syntax *.clj,*.cljs RainbowParenthesesLoadSquare
au Syntax *.clj,*.cljs RainbowParenthesesLoadBraces

" dbext
let g:dbext_default_history_file = '$HOME/.vim/dbext_history.txt'

" ultisnips
let g:UltiSnipsExpandTrigger = '<C-s>'
let g:UltiSnipsListSnippets = '<C-e>'

" pydoc
let g:pydoc_open_cmd = 'vsplit'
let g:pydoc_highlight = 0

" pasta
let g:pasta_disabled_filetypes = ['python', 'coffee', 'yaml', 'haskell', 'behat']

" syntastic options
let g:syntastic_enable_signs=1
let g:syntastic_enable_balloons=1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = { 'mode': 'active',
                            \ 'passive_filetypes': ['scala', 'java'] }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_ignore_files = ['*.html']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" JSX
let g:jsx_ext_required = 0

" command-t
let g:CommandTMaxHeight=20
let g:CommandTMaxFiles=30000

" Gundo
nnoremap <F5> :GundoToggle<CR>

" Fugitive
nmap <leader>g :Ggrep '<C-R><C-W>'<CR>
vmap <leader>g y:Ggrep '<C-R>"'<CR>
autocmd BufReadPost fugitive://* set bufhidden=delete

" Lusty
let g:LustyJugglerShowKeys = 0

" Ack
let g:ackprg="ack -H --nocolor --nogroup --column --ignore-dir=cache --ignore-dir=logs --ignore-dir=build"
nmap <leader>a :Ack '<C-R><C-W>'<CR>
vmap <leader>a y:Ack '<C-R>"'<CR>

" indents guides
let g:indent_guides_guide_size = 1

" js beautify
autocmd FileType javascript noremap <buffer> <leader>f :call JsBeautify()<cr>
autocmd FileType javascript vnoremap <buffer> <leader>f :call RangeJsBeautify()<cr>

" typescript tools
let g:tsuquyomi_disable_default_mappings = 1
autocmd FileType typescript nmap <buffer> <Leader>s : <C-u>echo tsuquyomi#hint()<CR>
autocmd FileType typescript nmap <buffer> <C-]> :TsuDefinition<CR>

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
autocmd BufWritePre *.php,*.c,*.cpp,*.py,*.js,*.ts,*.tsx,*.hs,*.java,*.scala,*.rb,*.twig,*.html,*.xml,*.css,*.less,*.styl,*.vim,*.feature,*.md,*.markdown,*.clj,*.cljs,*.jade :call <SID>StripTWS()

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

" Clean code function
function! s:CleanCode()
  %retab " Replace tabs with spaces
  %s= *$==e " Delete end of line blanks
  %s/\r//eg " Remove DOS returns ^M
  echo "Cleaned up this mess."
endfunction
com! CleanCode call s:CleanCode()

" Project settings
function! s:SetupEnvironment()
  let l:path = expand('%:p')
  if l:path =~ '/home/vve/dev/foyer-sammy'
    setlocal tabstop=4
    setlocal shiftwidth=4
    setlocal softtabstop=4
  endif
endfunction
autocmd! BufReadPost,BufNewFile * call s:SetupEnvironment()

" }}}

" vim:fdm=marker
