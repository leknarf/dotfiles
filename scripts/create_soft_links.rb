#!/usr/bin/env ruby
# Based on http://errtheblog.com/posts/89-huba-huba

require 'fileutils'
EXCLUDES = ['scripts', 'README.markdown']

FileUtils.cd('..')
home = File.expand_path('~')
targets = Dir['*'].reject {|f| EXCLUDES.include? f}

puts "About to create dotfiles for: #{targets}"
puts "Proceed? (Y/n)"
confirm = gets
exit unless confirm[0] == 'Y'

targets.each do |file|
  next if EXCLUDES.include? file
  puts "Updating dotfile: #{file}"
  target = File.join(home, ".#{file}")
  `rm #{target}`
  `ln -s #{File.expand_path file} #{target}`
end
