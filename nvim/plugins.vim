" PLUGINS SETTINGS

" fzf
nnoremap <leader>mb :Buffers<cr>
nnoremap <leader>mg :GFiles<cr>
nnoremap <leader>mf :Files<cr>

" airline
let g:airline_theme='one'
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_mode_map = {
    \ '__'     : '-',
    \ 'c'      : 'C',
    \ 'i'      : 'I',
    \ 'ic'     : 'I',
    \ 'ix'     : 'I',
    \ 'n'      : 'N',
    \ 'multi'  : 'M',
    \ 'ni'     : 'N',
    \ 'no'     : 'N',
    \ 'R'      : 'R',
    \ 'Rv'     : 'R',
    \ 's'      : 'S',
    \ 'S'      : 'S',
    \ ''     : 'S',
    \ 't'      : 'T',
    \ 'v'      : 'V',
    \ 'V'      : 'V',
    \ ''     : 'V',
    \ }

" pasta
let g:pasta_disabled_filetypes = ['python', 'coffee', 'yaml', 'haskell', 'behat']

" JSX
let g:jsx_ext_required = 0

" Fugitive
nmap <leader>g :Ggrep '<C-R><C-W>'<CR>
vmap <leader>g y:Ggrep '<C-R>"'<CR>
autocmd BufReadPost fugitive://* set bufhidden=delete

" indents guides
let g:indent_guides_guide_size = 1

" typescript tools
au BufRead,BufNewFile *.tsx set filetype=typescript
let g:tsuquyomi_disable_default_mappings = 1
let g:tsuquyomi_completion_detail = 1
autocmd FileType typescript nmap <buffer> <Leader>s : <C-u>echo tsuquyomi#hint()<CR>
autocmd FileType typescript nmap <buffer> <C-]> :TsuDefinition<CR>
autocmd FileType typescript setlocal completeopt+=menu,preview
