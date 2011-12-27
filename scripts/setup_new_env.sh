#!/bin/bash

if [[ ! -L ~/.ssh ]]; then
  echo "Copying SSH keys"
  rm -rf ~/.ssh/
  ln -s ~/Dropbox/.ssh ~/.ssh
fi

if [[ ! `which brew` ]]; then
  echo "Installing homebrew and unix packages"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
  brew install libiconv # Required by ruby
  brew install ack
  brew install tree
  brew install git
  brew install xz coreutils
fi

if ! type rvm; then
  echo "Installing/Updating Ruby"
  bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
  CC=gcc-4.2 rvm install 1.9.2 --with-iconv-dir=/usr/local/Cellar/libiconv/1.14.1
  rvm --default use 1.9.2
fi

if [[ ! `which virtualenv` ]]; then
  echo "Installing system-level Python packages"
  sudo easy_install readline virtualenv virtualenvwrapper ipython
fi

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

echo "Configuring VIM"
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/swp
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -so ~/.vim/autoload/pathogen.vim \
  https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
./update_bundles.rb

echo "Creating soft links to dotfiles"
./create_soft_links.rb
