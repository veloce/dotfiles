if exists("b:did_ftplugin") | finish | endif

setlocal formatprg=~/src/scalariver/scalariver\ --url=http://localhost\:8098\ --stdin\ --stdout\ -f\ +alignSingleLineCaseStatements\ +compactControlReadability\ +doubleIndentClassDeclaration\ +preserveDanglingCloseParenthesis
setlocal commentstring=//%s

setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

setlocal tags+=$HOME/.scala-srcs/tags

" Format with scalariform and sort imports
nmap <buffer> <leader>i mygggqG'y:SortScalaImports<CR>
