# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

PATH=~/bin:$PATH

# get ma aliases
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

# Load functions
[[ -f ~/bin/to/to.sh ]] && source ~/bin/to/to.sh
[[ -f ~/bin/functions.sh ]] && source ~/bin/functions.sh

# load xresources
#which xrdb > /dev/null 2>&1 /dev/null && [[ -f ~/.rxvtrc ]] && xrdb ~/.rxvtrc 
$(which xrdb) > /dev/null 2>&1 /dev/null && [[ -f ~/.rxvtrc ]] && xrdb ~/.rxvtrc
