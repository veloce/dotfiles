# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="veloce"

# Set to this to use case-sensitive completion
export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# enable ^R for searching history
bindkey '^R' history-incremental-search-backward

# Prepend user bin directory to the path if it exists
[ -d "$HOME/bin" ] && PATH=$HOME/bin:$PATH

# My favourite editor
export EDITOR='vim'
export GIT_EDITOR='vim'

# some aliases
alias h='history'
alias mkdir='mkdir -p'
alias clisp='clisp -q -modern'
alias sf='php symfony'
alias s='git status'

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
    vim -XMnR "+runtime! ftplugin/man.vim" "+Man $1" "+set nomodifiable" "+only"
}

# Display a random adage each time bash is called
[ -x /usr/games/fortune ] && [ -x /usr/games/cowsay ] && fortune | cowsay
