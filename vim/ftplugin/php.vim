" Indent PHP templates as HTML files
nmap <leader>it :set ft=html<cr>mhgg=G'h:set ft=php<cr>

" enable syntax code completion
"setlocal omnifunc=syntaxcomplete#Complete
"let g:omni_syntax_group_exclude_php = 'phpCoreConstant,phpConstant'

" jump to a twig view in symfony
function! s:JumpToView()
    setlocal path+=**
    mark C
    normal! ]M
    let end = line(".")
    normal! [m
    try
        call search('\v[^.:]+\.html\.twig', '', end)
        normal! gf
    catch
        normal! g`C
        echohl WarningMsg | echomsg "Template file not found" | echohl None
    endtry
endfunction
com! JumpToView call s:JumpToView()
autocmd BufEnter *Controller.php map <buffer><leader>v :JpToView<CR>

nmap <buffer><leader>ns :call PhpInsertUse()<CR>

" Replace namespace and class name based on filename
nmap <buffer> <unique> <leader>pn gg/namespace <CR>D"%PdF/r;:s#/#\\#<CR>Inamespace  <ESC>d/[A-Z]<CR>/class <CR>wcw<C-R>=expand("%:t:r")<CR><ESC>

" fast arrow
imap <buffer> -- ->

" phpdoc
nnoremap <C-P> :call PhpDocSingle()<CR> 
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
