" PLUGINS SETTINGS

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
