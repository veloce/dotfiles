" Indent PHP templates as HTML files
nmap <leader>it :set ft=html<cr>mhgg=G'h:set ft=php<cr>

" enable syntax code completion
setlocal omnifunc=syntaxcomplete#Complete
let g:omni_syntax_group_exclude_php = 'phpCoreConstant,phpConstant'

" fast arrow
imap jj ->

" phpdoc
nnoremap <C-S-D> :call PhpDocSingle()<CR> 
let g:pdv_cfg_Author = "Vincent Velociter"

"Folding
nmap <buffer> <F5> <Esc>:EnableFastPHPFolds<Cr>
nmap <buffer> <C-F5> <Esc>:EnablePHPFolds<Cr>
nmap <buffer> <F6> <Esc>:DisablePHPFolds<Cr>
let g:DisableAutoPHPFolding = 1

"PHP Colors
hi link phpVarSelector Identifier
hi link phpIdentifier Identifier
hi link phpParent Normal
hi link phpFunctions Function
hi link phpSpecial Special
hi link phpMemberSelector Keyword
hi link phpBoolean Boolean
hi link phpNumber Number

" HTML colors
hi link htmlTag Normal
hi link htmlTagName Normal
hi link htmlEndTag Normal

" CTAGS 
nnoremap <silent> <C-F7> :silent !ctags -h ".php" --PHP-kinds="+cf" --recurse --exclude="*/cache/*" --exclude="*/logs/*" --exclude="*/data/*" --exclude="\.git" --exclude="\.svn" --languages="PHP"<cr>

