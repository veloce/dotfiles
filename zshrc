export EDITOR=vim
export BROWSER=chromium-browser

# history
HISTSIZE=90000
SAVEHIST=90000
setopt SHARE_HISTORY

# autocompletion
autoload -Uz compinit
compinit

# Set up the prompt (with git branch name)
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'
setopt PROMPT_SUBST
PROMPT='%m ${PWD/#$HOME/~}${vcs_info_msg_0_} > '

# enable color support of ls and also add handy aliases
hash dircolors 2>/dev/null && eval $(dircolors $HOME/.dotfiles/dircolors-solarized/dircolors.ansi-dark)
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'

# aliases
alias l='ls -Alh'
alias ll='ls -lh'
alias la='ls -a'   # show hidden files
alias lx='ls -lXB'  # sort by extension
alias lk='ls -lSr'  # sort by size, biggest last
alias df='df -h'
alias du='du -h'
alias mkdir='mkdir -p'
alias h='history'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias clisp='clisp -q -modern'
alias p='python'
alias chromedev='chromium --user-data-dir="$HOME/.chrome-dev"'
alias sorteddu='du -sch .[!.]* * |sort -h'
alias pylibtags='ctags `python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"`'
alias sqltags='ctags --languages=+SQL'


# git aliases
alias g='git'
alias s='git status'
alias gp='git push'
alias gd='git diff'
alias gc='git commit -v'
alias gco='git checkout'
alias gba='git branch -av'

# Custom docker ps
docker() {
    if [[ $@ == "ps" ]]; then
        command docker ps --format "table {{.Names}}\t{{.Ports}}\t{{.Status}}"
    else
        command docker "$@"
    fi
}

# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'$*'*' -ls ; }

# Find a file with pattern $1 in name and Execute $2 on it:
function fe()
{ find . -type f -iname '*'${1:-}'*' -exec ${2:-file} {} \;  ; }

# Handy extract program
function extract()
{
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xvjf $1     ;;
             *.tar.gz)    tar xvzf $1     ;;
             *.bz2)       bunzip2 $1      ;;
             *.rar)       unrar x $1      ;;
             *.gz)        gunzip $1       ;;
             *.tar)       tar xvf $1      ;;
             *.tbz2)      tar xvjf $1     ;;
             *.tgz)       tar xvzf $1     ;;
             *.zip)       unzip $1        ;;
             *.Z)         uncompress $1   ;;
             *.7z)        7z x $1         ;;
             *)           echo "'$1' cannot be extracted via >extract<" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# Open man pages in vim
function vman()
{
    vim -u "~/.vimrc_git" -XMnR "+runtime! ftplugin/man.vim" "+Man $1" "+set nomodifiable" "+only"
}

if [ "$(uname)" = "Darwin" ]; then
  source ~/.dotfiles/osxzshrc
fi

# Display a random adage each time bash is called
# hash fortune 2>/dev/null && hash cowsay 2>/dev/null && fortune | cowsay
if hash cowsay 2>/dev/null; then
  ~/.dotfiles/sgen/sgen.js | cowsay
fi
