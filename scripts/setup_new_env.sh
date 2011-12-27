#!/bin/bash

echo "Copying SSH keys"
[[ -e ~/.ssh/ ]] && rm -rf ~/.ssh/
ln -s ~/Dropbox/.ssh ~/.ssh

if ! type rvm; then
  echo "Installing/Updating Ruby"
  bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
  rvm install 1.9.2
  rvm --default use 1.9.2
fi

# TODO: Setup python

if [[ ! `which brew` ]]; then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
    brew update
fi

if [[ ! `which macvim` ]]; then
    echo "Installing macvim"
    brew install macvim
    brew linkapps
fi

echo "Installing additional packages"
[[ `which psql` == "/usr/local/bin/psql" ]] || brew install postgres
[[ `which ack` ]] || brew install ack

echo "Configuring VIM"
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/swp
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -so ~/.vim/autoload/pathogen.vim \
  https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
./update_bundles.rb

echo "Creating soft links to dotfiles"
./create_soft_links.rb
