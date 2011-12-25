#!/bin/bash

# TODO: Setup ruby/python

# Install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
brew install macvim
brew linkapps

# Setup Shell
./create_soft_links.rb

# Setup VIM
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/swp
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -so ~/.vim/autoload/pathogen.vim \
  https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
./update_bundles.rb
