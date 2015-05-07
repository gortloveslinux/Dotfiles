export PATH="/usr/local/bin:$PATH"
source ~/.zsh/antigen/antigen.zsh
source /etc/profile
export JAVA_HOME=$(ls -1d /usr/lib/jvm/* | grep java.\*$ | tail -1)

antigen use oh-my-zsh

# Bundles
antigen bundle tmux
antigen bundle git
antigen bundle vi-mode
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
