if expand("%:r") == ".git/COMMIT_EDITMSG"
    startinsert
    " fast save and quit
    imap <buffer> <Tab> <ESC>:wq<CR>
endif
