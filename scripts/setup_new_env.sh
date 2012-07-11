#!/bin/bash

set -ex

if [[ ! `which brew` ]]; then
  exit "You must manually install homebrew"
fi

if [[ ! -L ~/.ssh ]]; then
  echo "Copying SSH keys"
  mv ~/.ssh/ ~/.ssh.backup
  ln -s ~/Dropbox/ssh ~/.ssh
  chmod 600 ~/.ssh/*
fi

unix_pkgs=("ack" "mercurial" "tree" "git" "xz" "coreutils" "watch" "ctags" "gawk")
for pkg in "${unix_pkgs[@]}"; do
  if [[ -z `brew list | grep $pkg` ]]; then
    echo "Installing $pkg"
    brew install $pkg
  fi
done

if ! type rvm &> /dev/null; then
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

if [[ -z `vim --version | grep +clipboard` ]]; then
    echo "Replacing the builtin vim"
    brew install macvim --override-system-vim
fi

echo "Configuring VIM"
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/swp
mkdir -p ~/.vim/undo
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -so ~/.vim/autoload/pathogen.vim \
  https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim

if [[ ! -d ~/.oh-my-zsh ]]; then
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi
