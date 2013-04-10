# Run System profile
. /etc/profile

# Run personal script
[[ -f ~/.bashrc ]] && source ~/.bashrc

export TERM=xterm-256color
export INPUTRC=~/.inputrc
unset TMOUT
