# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit-custom"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting fzf)

source $ZSH/oh-my-zsh.sh

# Aliases
# -------
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias tmator='tmuxinator'
alias vim='nvim'
alias clock='tty-clock -cbtC4'
alias ta='tmux attach -t'
alias tn='tmux new-session -s'
alias tk='tmux kill-session -t'
alias tm='tmuxinator'

# NVM Exports
# -----------
export NVM_DIR=~/.nvm
export EDITOR='nvim'

# Source Files
# ------------
for f in ~/.zsh/*; do source $f; done
# source $(brew --prefix nvm)/nvm.sh


# PG
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin

# Go Path
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=/Users/codycallahan/Documents/libs/go_appengine:$PATH # AppEngine

# Rust Path
export PATH="$HOME/.cargo/bin:$PATH"

# RVM
# ---
export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# NVM
# ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/sbin:$PATH"
