require 'fileutils'
require 'etc'

module DotMe
  class Dsl 
    def self.run( filename )
      self.new.instance_eval( ::File.read(filename), filename )
    end

    def _backup( what, where )
      FileUtils.rm_rf where unless !::File.directory? where
      Dir.mkdir where, 0700

      what.each do |file|
        from = ::File.join Etc.getpwuid.dir, file
        unless file[0] != '.'
          file = file[1..-1]
        end 
        if File.exists? from
          puts "Backupping #{from} to #{where} ..."
          FileUtils.mv from, ::File.join( where, file ) 
        end
      end
    end

    def _link( what, where )
      puts "Symlinking #{what} to #{where} ..."
      what = File.absolute_path what
      File.symlink what, where
    end

    def method_missing( name, *args )
      name = "_#{name}"
      if respond_to? name
        args.each_with_index do |arg,i|
          args[i] = arg.is_a?(String) ? arg.gsub( '~', Etc.getpwuid.dir ) : arg.map { |v| v.gsub( '~', Etc.getpwuid.dir ) }
        end
        send name.to_sym, *args
      end
    end

    def git_clone( repo, where )
      system "git clone #{repo} \"#{where}\""
    end

    def sh( cmd )
      system cmd
    end
  end
end
