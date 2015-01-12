PATH=~/bin:$PATH
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f /usr/local/Cellar/todo-txt/2.10/etc/bash_completion.d/todo_completion ]] && source /usr/local/Cellar/todo-txt/2.10/etc/bash_completion.d/todo_completion && complete -F _todo t

PS1='\u@\h:\w$ '
export PS1
