" PLUGINS SETTINGS

" fzf
nnoremap <leader>mb :Buffers<cr>
nnoremap <leader>mg :GFiles<cr>
nnoremap <leader>mf :Files<cr>

" command-t
let g:CommandTMaxHeight=20
let g:CommandTMaxFiles=30000
" grrr fix for command-t
let g:CommandTWildIgnore=&wildignore . ",*/node_modules,*/build,*/cache,*/target"

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

function! MetalsStatus() abort
  return get(g:, 'metals_status', '')
endfunction

function! AirlineInit()
  let g:airline_section_x = airline#section#create(['%{MetalsStatus()}', ' ', 'filetype'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

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

" dart
highlight link dartSdkClass Normal
highlight link dartUserType Normal
highlight link CocInlayHintParameter Comment
highlight link CocInlayHintType Comment
