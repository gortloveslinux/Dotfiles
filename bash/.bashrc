export NOTE_DIR=$HOME/Documents/notes
export GOPATH=$HOME/projects/go

BASHRC=$HOME/.bashrc
PATH=/usr/sbin:$PATH
PATH=$HOME/bin:$PATH
PATH=$GOPATH/bin:$PATH

set -o vi

PS1='\u@\h:\w$ '
export PS1

alias cdnote='cd $NOTE_DIR'
alias ll='ls -alF'
alias la='ls -A'
alias sl='ls'
alias serve='python -m SimpleHTTPServer'
