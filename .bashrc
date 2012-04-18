# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# Spaces around the path so you can easily double click to select it
PS1='${debian_chroot:+($debian_chroot)}\u@\h: \w \[\033[1;33m\]⚡ \[\033[1;37m\]'

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# custom helper functions and environment variables
if [ -f ~/.bash_functions ]; then
  . ~/.bash_functions
fi
