# Use Z
#. `brew --prefix`/etc/profile.d/z.sh

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias nvim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
alias vim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
alias python='python2' # used for google appengine

alias tmator='tmuxinator'
export EDITOR=nvim

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function work(){
  tmux attach -t work || tmuxinator work
}

function docker-run(){
  docker-compose run web "$@"
}

function kbd-setup(){
  # Load keybindings
  xmodmap ~/.Xmodmap

  # Key Repeat speed
  xset r rate 300 20
}

function gpass(){
  lpass show -c --password $(lpass ls  | fzf | awk '{print $(NF)}' | sed 's/\]//g')
}

# ===============================================================================================
# PATH
# ===============================================================================================

# codyss-t.tunnlr.com
function tunnlr() {
  ssh  -nNt -g -R :12821:0.0.0.0:3001 tunnlr3599@ssh1.tunnlr.com
}

function dk-tunnlr() {
  ssh  -nNt -g -R :12821:0.0.0.0:3006 tunnlr3599@ssh1.tunnlr.com
}

# codyssdesigner-t.tunnlr.com
function des_tunnlr() {
  ssh  -nNt -g -R :13218:0.0.0.0:4000 tunnlr4123@ssh1.tunnlr.com
}


# Node Version Manager
export NVM_DIR="/home/cody/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

