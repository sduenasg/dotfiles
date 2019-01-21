#
# ~/.bashrc
#

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

stty -ixon # Disable ctrl-s and ctrl-q (pause and resume)
shopt -s autocd # Allows to cd into directory by typing the directory name.
shopt -s histappend # Enable history appending instead of overwriting
shopt -s expand_aliases

# check window size after each command and update the values of lines and columns if necessary
shopt -s checkwinsize

xhost +local:root > /dev/null 2>&1

# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

#PS1 prompt
PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '

# Simple PS1 without colors
#PS1='\u@\h \w \$ '

#Aliases
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less
alias ls='ls -hN --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

