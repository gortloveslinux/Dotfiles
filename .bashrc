PATH=~/bin:$PATH

set -o vi

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

[[ -f ~/bin/to/to.sh ]] && . ~/bin/to/to.sh

# Setup todo.txt completion
[[ -f ~/bin/todo.txt/todo_completion ]] && . ~/bin/todo.txt/todo_completion
complete -F _todo t
