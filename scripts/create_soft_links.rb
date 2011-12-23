#!/usr/bin/env ruby
# Based on http://errtheblog.com/posts/89-huba-huba

require 'fileutils'
EXCLUDES = ['scripts', 'README.markdown']

FileUtils.cd('..')
home = File.expand_path('~')

Dir['*'].each do |file|
  next if EXCLUDES.include? file
  puts "Updating dotfile: #{file}"
  target = File.join(home, ".#{file}")
  `rm #{target}`
  `ln -s #{File.expand_path file} #{target}`
end
