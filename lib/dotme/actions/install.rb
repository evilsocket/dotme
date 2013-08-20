require 'dotme/dsl'

if File.exists? 'Dotfile'
  DotMe::Dsl.run 'Dotfile'
else
  puts 'No Dotfile found.'
end
