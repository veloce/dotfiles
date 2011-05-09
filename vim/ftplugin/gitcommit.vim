if expand("%:r") == ".git/COMMIT_EDITMSG"
    startinsert
    " fast save and quit
    imap <Tab> <ESC>:wq<CR>
endif
