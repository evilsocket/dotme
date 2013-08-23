require 'fileutils'
require 'dotme/incubator'
require 'dotme/loader'

if !$options[:add]
  puts "No target specified, please invoke 'dotme add <file-or-folder>'."
  exit
elsif !::File.exist? $options[:output]
  puts "Folder '#{$options[:output]}' does not exist, aborting."
  exit
end

DotMe::Loader.load!

begin
  DotMe::Incubator.incubate $options[:add], $options[:output] 
rescue DotMe::NoIncubator
  puts "No suitable incubator for #{item}, skipping ..."
end

dotfile = []
File.open( "#{$options[:output]}/Dotfile", 'r' ).each_line do |line|
  dotfile << line.chop
end

# search backwards for first not user prepended line
lineno = dotfile.count
dotfile.reverse_each do |line|
  break unless line.match '^sh\s.+$' 
  lineno -= 1
end
# insert new data from there
DotMe::Incubator.cells.each do |cell|
   op, to, what, where = cell.keys + cell.values
   dotfile.insert lineno, "#{op} \"#{what}\", \"#{where}\""
   lineno += 1
end

File.open( "#{$options[:output]}/Dotfile", 'w+t' ){ |file| file << dotfile.join( "\n" ) }

File.open( "#{$options[:output]}/README.md", 'a+t' ) do |readme|
  readme << <<README
### Updated on #{Time.now}

    dotme add "#{$options[:add]}"
README
end
