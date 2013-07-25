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
plugins=(git osx knife)

source $ZSH/oh-my-zsh.sh
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gbd="git branch -d"
alias gbD="git branch -D"


# Homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Python
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export WORKON_HOME=~/virtualenvs
source /usr/local/share/python/virtualenvwrapper.sh

# Node
export NODE_PATH="/usr/local/lib/node:/usr/local/lib/node_modules"
export PATH="$PATH:/usr/local/share/npm/bin"

# Ruby
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - zsh)"

# Zshell
cdpath=(~ ~/Dropbox/Development ~/Dropbox/ /Users/andrew/Dropbox/Leknarf\ Labs)
export CDPATH
PUSHD_MINUS=1

# Fix for Vim NerdTree problem
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Chef
export EDITOR=vim

# Nethack
export PATH=$PATH:/usr/games/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
