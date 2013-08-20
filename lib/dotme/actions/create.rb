require 'fileutils'
require 'dotme/incubator'
require 'dotme/loader'

if ::File.exist? $options[:output]
  print "Folder '#{$options[:output]}' already exists, overwrite ? [y/N] "
  overwrite = $stdin.gets.chop
  exit unless overwrite == 'y' or overwrite == 'Y'
  FileUtils.rm_rf $options[:output]
end

DotMe::Loader.load!

$options[:targets].each do |item|
  begin
    DotMe::Incubator.incubate item, $options[:output] 
  rescue DotMe::NoIncubator
    puts "No suitable incubator for #{item}, skipping ..."
  end
end

File.open( "#{$options[:output]}/Dotfile", 'w+t' ) do |dotfile|
  dotfile << "backup #{$options[:targets]}, \"#{$options[:backup]}\"\n" 
  $options[:prepend].each do |command|
    dotfile << "sh \"#{command}\"\n"
  end
  DotMe::Incubator.cells.each do |cell|
    op, to, what, where = cell.keys + cell.values
    dotfile << "#{op} \"#{what}\", \"#{where}\"\n"
  end
  $options[:append].each do |command|
    dotfile << "sh \"#{command}\"\n"
  end
end

File.open( "#{$options[:output]}/README.md", 'w+t' ) do |readme|
  readme << <<README
DotMe - My personal dot files.
===

This is my personal dot files archive easily generated with [DotMe](http://rubygems.org/gems/dotme) using the following command line:

    dotme #{$options[:cmdline]} 

## Requirements

In order to install this archive to your system, you will need ruby installed and the dotme gem.

## Installation

    cd path-to/#{$options[:output]} && dotme

README
end
