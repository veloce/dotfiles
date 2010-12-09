# enable vi mode
set -o vi

# My favourite editor
export EDITOR='vim'

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# enable auto-completion after those commands
#complete -cf sudo
#complete -cf man

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# prompt that display current git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1="\w\$(parse_git_branch) $ "

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ] || [ -x /bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -Al'   # show hidden files
alias lx='ls -lXB'  # sort by extension
alias lk='ls -lSr'  # sort by size, biggest last

alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias h='history'

alias clisp='clisp -q -modern'
alias sf='php symfony'

# Git submodule shortcuts
alias subupdate='git submodule sync && git submodule update --init --recursive'
alias subcheckout='git submodule foreach git checkout master'
alias subreset='git submodule foreach --recursive git checkout -- . && git submodule foreach --recursive git clean -f'
alias subpull='git submodule foreach git pull'
alias subdiff='git submodule foreach --recursive git diff'
alias subecho="git submodule foreach 'echo \$name \$sha1:`git rev-parse HEAD`'"

# Git completion
source ~/.git-completion.bash

# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'$*'*' -ls ; }

# Find a file with pattern $1 in name and Execute $2 on it:
function fe()
{ find . -type f -iname '*'${1:-}'*' -exec ${2:-file} {} \;  ; }

# Display a random adage each time bash is called
[ -x /usr/games/fortune ] && [ -x /usr/games/cowsay ] && fortune | cowsay
