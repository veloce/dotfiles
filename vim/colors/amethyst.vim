" Amethyst color scheme for gvim, version 0.1
" by Antoine Kalmbach - ane {AT} iki *DOT* fi

highlight clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "amethyst"

hi Comment      guifg=#555555 gui=bold,italic
hi Conditional  guifg=#033E6B gui=bold
hi Constant     guifg=#a512d5
hi Cursor       guifg=white   guibg=#333333
hi CursorColumn guibg=#cccccc
hi CursorLine   guibg=#cccccc
hi Define       guifg=#222222 gui=bold
hi Error        guifg=white   guibg=#990022 gui=none
hi Float        guifg=#0088BB
hi Folded       guifg=#111111 guibg=#cccccc
hi Function     guifg=#033E6B gui=bold
hi Identifier   guifg=#640CAB gui=bold
hi LineNr       guifg=#444444 guibg=#dddddd 
hi MatchParen   guifg=#7D0057 guibg=white gui=bold
hi NonText      guifg=#111111 guibg=white
hi Normal       guifg=#000000 guibg=#fefefe
hi Number       guifg=#3B2E84
hi Operator     guifg=#222222 gui=bold
hi Pmenu        guifg=#222222 guibg=#990000
hi PreProc      guifg=#180773 gui=bold
hi Repeat       guifg=#222222 gui=bold
hi Special      guifg=#7D0057 
hi SpecialKey   guifg=#7D0057 guibg=#e8e8e8 gui=bold  
hi Statement    guifg=#033E6B gui=bold
hi StatusLine   guifg=white   guibg=#582781 gui=bold
hi StatusLineNC guifg=white   guibg=#582781 gui=none
hi String       guifg=#C10087
hi Structure    guifg=#033E6B gui=bold
hi TabLine      guifg=white   guibg=#582781
hi TabLineFill  guifg=#9098a0
hi TabLineSel   guifg=white   guibg=#dd1144 gui=bold
hi Title        guifg=#202020 gui=bold
hi Todo         guifg=white   guibg=#dd1144 gui=bold,underline
hi Type         guifg=#640CAB gui=bold 
hi Underlined   guifg=#202020 gui=underline
hi VertSplit    guibg=#A468D5 guifg=#582781
hi lCursor      guifg=black   guibg=white

