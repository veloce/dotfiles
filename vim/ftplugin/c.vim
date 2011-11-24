if exists("b:did_ftplugin") | finish | endif

setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
nmap <buffer><f2> :w\|!compile %<CR>
