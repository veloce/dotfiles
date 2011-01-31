" Insert a blank line and start insert mode
1s/^$/\r/e
goto 1
startinsert

" Fast save and quit for git commit
imap <Tab> <ESC>:wq<CR>
