#!/bin/bash

if [[ ! -L ~/.ssh ]]; then
  echo "Copying SSH keys"
  mv ~/.ssh/ ~/.ssh.backup
  ln -s ~/Dropbox/ssh ~/.ssh
fi

if [[ ! `which brew` ]]; then
  echo "Installing homebrew and unix packages"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
fi

unix_pkgs=("ack" "mercurial" "tree" "tmux" "git" "xz" "coreutils" "watch")
for pkg in "${unix_pkgs[@]}"; do
  if [[ -z `brew list | grep "$pkg"` ]]; then
    echo "Installing $pkg"
    brew install "$pkg"
  fi
done

if [[ ! `which reattach-to-user-namespace` ]]; then
  echo "Installing pasteboard wrapper script for tmux"
  mkdir -p /usr/local/src
  cd /usr/local/src
  git clone git://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard tmux_wrapper
  cd tmux_wrapper
  make reattach-to-user-namespace
  cp reattach-to-user-namespace /usr/local/bin
fi

if ! type rvm &> /dev/null; then
  echo "Installing/Updating Ruby"
  brew install libiconv # Required by ruby
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
    mkdir -p /usr/local/src
    cd /usr/local/src
    hg clone https://vim.googlecode.com/hg/ vim
    cd vim
    ./configure --prefix=/usr/local --enable-rubyinterp --enable-pythoninterp --enable-gui --with-features=huge
    make
    make install
fi

echo "Configuring VIM"
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/swp
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -so ~/.vim/autoload/pathogen.vim \
  https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim

if [[ ! -d ~/.oh-my-zsh ]]; then
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi
