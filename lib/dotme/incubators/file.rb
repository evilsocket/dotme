require 'fileutils'

module DotMe
  class File < Incubator 
    def incubate(to)
      FileUtils.cp_r @path, ::File.join( to, @basename ) 

      { :link => @basename, :to => @relative }
    end

    def self.incubates?(path)
      ::File.file? path
    end
  end
end

