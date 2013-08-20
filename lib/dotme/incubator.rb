require 'etc'
require 'dotme/errors'

module DotMe
  class Incubator 
    @@incubators = []
    @@cells     = []

    def initialize(path)
      @path     = path
      @relative = @path.gsub( Etc.getpwuid.dir, '~' )
      @basename = ::File.basename @path
      unless @basename[0] != '.'
        @basename = @basename[1..-1]
      end
    end

    def self.register!(c)
      raise TypeError, 'Not an Incubator derived class.' unless c.respond_to? :incubates?
      @@incubators << c
    end

    def self.incubate(path,to)
      path = ::File.join( Etc.getpwuid.dir, path ) unless ::File.exists? path

      Dir.mkdir to, 0700 unless ::File.directory? to

      puts "Incubating #{::File.basename path} to #{to}"
      incubator = nil
      # get the last valid incubator
      @@incubators.each { |c| if c.incubates? path then incubator = c end }
      unless incubator 
        raise NoIncubator 
      end 

      @@cells << incubator.new(path).incubate(to)
    end

    def self.cells
      @@cells
    end
  end
end
