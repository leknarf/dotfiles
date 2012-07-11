#!/usr/bin/env ruby
# Based on http://errtheblog.com/posts/89-huba-huba

require 'fileutils'
EXCLUDES = ['scripts', 'README.markdown', 'com.googlecode.iterm2.plist']

FileUtils.cd('..')
home = File.expand_path('~')
targets = Dir['*'].reject {|f| EXCLUDES.include? f}

puts "About to create dotfiles for:"
targets.each {|t| puts "\t#{t}"}
puts "Proceed? (Y/n)"
confirm = gets
exit unless confirm.chars.first == 'Y'

targets.each do |file|
  next if EXCLUDES.include? file
  puts "Updating dotfile: #{file}"
  target = File.join(home, ".#{file}")
  `rm #{target} &> /dev/null`
  `ln -s #{File.expand_path file} #{target}`
end
