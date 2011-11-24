if exists("b:did_ftplugin") | finish | endif

" add python libraries to path
python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"setlocal path+=%s" % (p.replace(" ", r"\ ")))
EOF

setlocal tags+=$HOME/.vim/ctags/python.ctags
