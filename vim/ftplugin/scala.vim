if exists("b:did_ftplugin") | finish | endif

let b:did_ftplugin = 1

setlocal formatprg=~/scripts/scalariver\ --url=http://localhost\:8098\ --stdin\ --stdout\ -f\ +alignSingleLineCaseStatements\ +compactControlReadability\ +doubleIndentClassDeclaration\ +preserveDanglingCloseParenthesis
setlocal commentstring=//%s

setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

setlocal tags+=$HOME/.scala-srcs/tags

" Format with scalariform
nmap <buffer> <leader>i mygggqG'y<CR>

" macro to convert case class to anorm row parser
let @p = 'f:s <-lliget[f,s]("")0wyiwf"pcrsj0w'
