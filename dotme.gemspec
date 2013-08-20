require './lib/dotme/version'

Gem::Specification.new do |s|
  s.name = %q{dotme}
  s.version = DotMe::VERSION
  s.license = "BSD"

  s.authors = ["Simone Margaritelli"]
  s.description = %q{A gem to handle dot files easily.}
  s.email = %q{evilsocket@gmail.com}
  s.files = Dir.glob("lib/**/*") + Dir.glob("bin/*") + [
     "LICENSE",
     "README.md",
     "dotme.gemspec"
  ]
  s.executables   = %w(dotme)
  s.homepage = %q{http://github.com/evilsocket/dotme}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.summary = %q{A gem to handle dot files easily.}
end

