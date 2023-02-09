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
nmap <leader>lr :e <C-R>=expand("%:p:h") . "/"<CR><C-D>
nmap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
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

" flutter shortcuts
" nmap <leader>fr :CocCommand flutter.run --dart-define=LICHESS_HOST=http://l.org
" nmap <leader>hr :CocCommand flutter.dev.hotRestart<CR>
" nmap <leader>fq :CocCommand flutter.dev.quit<CR>
" nmap <leader>fd :CocCommand flutter.devices<CR>
