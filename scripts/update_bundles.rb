#!/usr/bin/env ruby

# Based on https://github.com/tsaleh/dotfiles/blob/master/vim/update_bundles

git_bundles = [ 
  "git://github.com/altercation/vim-colors-solarized.git",
  "git://github.com/astashov/vim-ruby-debugger.git",
  "git://github.com/ervandew/supertab.git",
  "git://github.com/godlygeek/tabular.git",
  "git://github.com/msanders/snipmate.vim.git",
  "git://github.com/pangloss/vim-javascript.git",
  "git://github.com/scrooloose/nerdtree.git",
  "git://github.com/timcharper/textile.vim.git",
  "git://github.com/tpope/vim-cucumber.git",
  "git://github.com/tpope/vim-endwise.git",
  "git://github.com/tpope/vim-fugitive.git",
  "git://github.com/tpope/vim-git.git",
  "git://github.com/tpope/vim-haml.git",
  "git://github.com/tpope/vim-markdown.git",
  "git://github.com/tpope/vim-rails.git",
  "git://github.com/tpope/vim-repeat.git",
  "git://github.com/tpope/vim-surround.git",
  "git://github.com/tpope/vim-vividchalk.git",
  "git://github.com/tsaleh/vim-matchit.git",
  "git://github.com/tsaleh/vim-shoulda.git",
  "git://github.com/tsaleh/vim-tcomment.git",
  "git://github.com/tsaleh/vim-tmux.git",
  "git://github.com/vim-ruby/vim-ruby.git",
  "git://github.com/vim-scripts/Gist.vim.git",
  "git://github.com/vim-scripts/AutoComplPop.git",
  "git://github.com/vim-scripts/IndexedSearch.git",
  "git://github.com/vim-scripts/jQuery.git",
]

require 'fileutils'
require 'open-uri'

bundles_dir = "~/.vim/bundle"
`mkdir -p #{bundles_dir}`
FileUtils.cd(File.expand_path(bundles_dir))

puts "trashing everything (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  puts "unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
end
