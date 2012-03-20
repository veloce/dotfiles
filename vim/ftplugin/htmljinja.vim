if exists("b:did_ftplugin") | finish | endif

hi link htmlTag Normal
hi link htmlTagName htmlTag
hi link htmlEndTag htmlTag

nmap <leader>j= :set ft=javascript<CR>=it:set ft=htmljinja<CR>
