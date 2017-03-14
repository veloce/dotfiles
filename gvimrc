" remove toolbar
set guioptions-=T
" remove menu bar
set guioptions-=m
" Don't show scrollbars
set guioptions-=r
set guioptions-=L
" disable popup dialogs
set guioptions+=c

colorscheme solarized
if &l:diff
  set guifont=Monaco:h10
else
  set guifont=Monaco:h14
endif
