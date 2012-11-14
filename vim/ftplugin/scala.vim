if exists("b:did_ftplugin") | finish | endif

setlocal formatprg=~/.dotfiles/scripts/scalariform\ --stdin
setlocal commentstring=//%s

setlocal tags+=$HOME/.scala-srcs/tags

" Format with scalariform
nmap <buffer> <leader>i mygggqG'y
