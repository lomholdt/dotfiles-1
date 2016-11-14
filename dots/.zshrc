# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting) #fzf

source $ZSH/oh-my-zsh.sh

# Aliases
# -------
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias vim='nvim'
alias el='/Applications/Electron.app/Contents/MacOS/Electron'
alias clock='tty-clock -cbtC4'
alias ta='tmux attach -t'
alias tn='tmux new-session -s'
alias tk='tmux kill-session -t'
alias tm='tmuxinator'

function screenshot() {
  scrot "%s.png" -e 'mv $f ~/Pictures/Screenshots/.' $@
}

# NVM Exports
# -----------
export NVM_DIR=~/.nvm
export EDITOR='nvim'

# Source Files
# ------------
for f in ~/.zsh/*; do source $f; done

# RVM
# ---
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# PG
# export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin

# Go Path
export GOROOT=/usr/lib/go
export GOPATH=/home/cody/go
export PATH=$PATH:$GOPATH/bin
export PATH=/home/cody/Documents/libs/go_appengine/:$PATH # AppEngine

# Used by ~/.config/systemd/user/ssh-agent.service to init ssh-agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export NVM_DIR="/home/cody/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

