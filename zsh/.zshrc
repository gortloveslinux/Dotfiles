unsetopt nomatch

export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=~/projects/GO/
export PATH=$GOPATH/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export TERM=xterm-256color
source ~/.zsh/antigen/antigen.zsh
source /etc/profile
export JAVA_HOME=$(ls -1d /usr/lib/jvm/* 2> /dev/null | grep java.\*$ | tail -1)
export VISUAL=vim
export EDITOR="$VISUAL"

antigen use oh-my-zsh

# Bundles
antigen bundle tmux
antigen bundle git
antigen bundle vi-mode
antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-history-substring-search

antigen theme minimal

antigen apply

# Set up vim mode
export KEYTIMEOUT=1

# bind k and j for history search in VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# bind UP and DOWN arrow keys for history search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


alias tmux="tmux -2"
