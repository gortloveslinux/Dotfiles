export PATH="/usr/local/bin:$PATH"
source ~/.zsh/antigen/antigen.zsh

antigen use oh-my-zsh

# Bundles
antigen bundle tmux
antigen bundle git
antigen bundle vi-mode

antigen theme minimal

antigen apply

# Set up vim mode
export KEYTIMEOUT=1
