require 'optparse'

module DotMe
  class Commander
    def self.dispatch!(argv)
      # make this global to let load-ed actions use it
      $options = {
        :cmdline => ARGV.join(' '),
        :action  => argv[0] || 'install',
        :verbose => true,
        :targets => [ '.oh-my-zsh', '.fonts', '.vimrc', '.vim', '.zshrc', '.bashrc' ],
        :output  => 'dotfiles',
        :backup  => '~/dotfiles.backup',
        :prepend => [],
        :append  => []
      }

      OptionParser.new do |opts|
        opts.banner = <<HELP
Usage: dotme ACTION [options]

Actions:
    create                           Create your dot files archive. 
    install                          Use the Dotfile in current directory to install your dot files, this is the default action.

Options:
HELP
        opts.on( '-T', '--targets TARGETS', "Files and folders to backup. DEFAULT: #{$options[:targets].join(', ')}" ) do |targets|
          $options[:targets] = targets.split ' '
        end

        opts.on( '-O', '--output FOLDER', "Directory to store your dot files in. DEFAULT: #{$options[:output]}" ) do |folder|
          $options[:output] = folder
        end

        opts.on( '-B', '--backup FOLDER', "Backup directory to store existing dot files. DEFAULT: #{$options[:backup]}" ) do |folder|
          $options[:backup] = folder
        end

        opts.on( '-P', '--prepend COMMAND', "Prepend a custom command to the Dotfile, can be use multiple times." ) do |command|
          $options[:prepend] << command
        end

        opts.on( '-A', '--append COMMAND', "Append a custom command to the Dotfile, can be use multiple times." ) do |command|
          $options[:append] << command
        end

      end.parse!

      begin
        load ::File.join ::File.dirname(__FILE__), "actions/#{$options[:action]}.rb"
      rescue LoadError 
        puts "#{$options[:action]} - No such action."
      end
    end
  end
end
