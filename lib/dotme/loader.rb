module DotMe
  class Loader
    def self.load!
      Dir[ ::File.join ::File.dirname(__FILE__), 'incubators/*.rb' ].each do |file|
        begin
          require file
          clazz = DotMe.const_get file.gsub( /^.*incubators\/(.+)\.rb$/, '\1' ).capitalize
          DotMe::Incubator.register! clazz 
        rescue; end
      end
    end
  end
end
