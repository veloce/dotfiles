" remove toolbar
set guioptions-=T
" remove menu bar
set guioptions-=m
" Don't show scrollbars
set guioptions-=r
set guioptions-=l
" disable popup dialogs
set guioptions+=c

colorscheme aldmeris
if &l:diff
  set guifont=Inconsolata\ 10
else
  set guifont=Inconsolata\ 12
endif
