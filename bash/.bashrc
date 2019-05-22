#
# ~/.bashrc
#

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion


stty -ixon # Disable ctrl-s and ctrl-q (pause and resume)
shopt -s autocd # Allows to cd into directory by typing the directory name.
shopt -s histappend # Enable history appending instead of overwriting
shopt -s expand_aliases

# check window size after each command and update the values of lines and columns if necessary
shopt -s checkwinsize

xhost +local:root > /dev/null 2>&1


[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

#PS1 prompt
PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '

# Simple PS1 without colors
#PS1='\u@\h \w \$ '

# Set up node version manager
source /usr/share/nvm/init-nvm.sh


#Aliases
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less
alias ls='ls -hN --color=auto --group-directories-first -A'
alias grep='grep --color=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias ls="ls -hN --color=auto --group-directories-first -A"
alias ci3="nvim ~/.config/i3/config"
alias la="ls -lAh"
