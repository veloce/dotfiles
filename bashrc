export EDITOR=vim
export BROWSER=chromium-browser

# history
export HISTCONTROL=erasedups
export HISTSIZE=100000
shopt -s histappend

shopt -s checkwinsize

stty -ixon

export PATH=$PATH:$HOME/android-sdk/sdk/platform-tools/:$HOME/android-sdk/sdk/tools/

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

export PATH=$HOME/bin:$PATH:$HOME/android-sdk/tools:$HOME/android-sdk/platform-tools

export NVM_DIR="/home/vve/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

nvm use 5.3.0

export SBT_OPTS="-Xmx1536M -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Xss2M"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# prompt that display current git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1="\[\033[1;34m\]@\h \w\$(parse_git_branch) $\[\033[0m\] "

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# enable color support of ls and also add handy aliases
eval $(gdircolors $HOME/.dotfiles/dircolors-solarized/dircolors.ansi-dark)
alias ls='gls --color=auto'
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
#alias vim='mvim -v'
#alias vimdiff='mvimdiff -v'
alias tmux="TERM=screen-256color-bce tmux"
alias chromedev='open -n -a Google\ Chrome --args --disable-web-security --user-data-dir=/Users/zengularity/.chrome_dev_user_data_dir'

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

# Display a random adage each time bash is called
[ -x `which fortune` ] && [ -x `which cowsay` ] && fortune | cowsay

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

