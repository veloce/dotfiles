if exists("b:did_ftplugin") | finish | endif

hi link htmlTag Normal
hi link htmlTagName htmlTag
hi link htmlEndTag htmlTag

nmap <leader>j= :set ft=javascript<CR>=it:set ft=htmljinja<CR>

" Indent templates as HTML files
nmap <buffer><leader>it :set ft=html<cr>mhgg=G'h:set ft=htmljinja<cr>
