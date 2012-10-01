# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="Soliah"
#ZSH_THEME='robbyrussell'
ZSH_THEME='af-magic'

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx)

source $ZSH/oh-my-zsh.sh

# Ruby
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - zsh)"

# Python
source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=~/virtualenvs

# Homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Zshell
cdpath=(~ ~/Dropbox/Development ~/Dropbox/)
export CDPATH
PUSHD_MINUS=1

# Fix for Vim NerdTree problem
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Node
export NODE_PATH="/usr/local/lib/node:/usr/local/lib/node_modules"
export PATH="$PATH:/usr/local/share/npm/bin"
