##

# Test if ls
#ls --version > /dev/null 2>&1 
#if [ "0" -eq "${?}" ]; then
#  color_options="--color=auto"
#else
#  color_options=""
#fi

alias ls="ls $(ls --version > /dev/null 2>&1 && echo '--color=auto')"
alias ll='ls -alF'
alias la='ls -A'
alias sl='ls'

alias v='vim'
alias gv='gvim'

alias lk='/usr/share/vim/vimcurrent/macros/less.sh'
alias follow='tail -F'

alias agrep='ack-grep'

alias tp='to -p'
alias tb='to -b'
alias tr='to -r'

alias serve='python -m SimpleHTTPServer'

alias t='~/bin/todo.txt/todo.sh -t -c -n'
##
