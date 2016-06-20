lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'passlock/version'
<<<<<<< HEAD
=======

>>>>>>> refs/remotes/origin/master
Gem::Specification.new do |gem|
  gem.name          = 'passlock'
  gem.version       = PassLock::VERSION
  gem.date          = '2016-06-18'
  gem.authors       = ['Snazzah']
  gem.email         = 'botboybeta@yahoo.com'
<<<<<<< HEAD
<<<<<<< HEAD
  gem.summary       = 'A gem that makes ideal passwords in various ways.'
  gem.description   = 'A gem that makes ideal passwords in various ways.'
  gem.files         = ['lib/passlock.rb', 'lib/passlock/class.rb', 'lib/passlock/version.rb']
=======
  gem.summary       = %q{A gem that makes ideal passwords in various ways.}
  gem.description   = %q{A gem that makes ideal passwords in various ways.}
  gem.files         = ["lib/passlock.rb","lib/passlock/class.rb","lib/passlock/version.rb"]
>>>>>>> refs/remotes/origin/master
=======
  gem.summary       = 'A gem that makes ideal passwords in various ways.'
  gem.description   = 'A gem that makes ideal passwords in various ways.'
  gem.files         = ['lib/passlock.rb', 'lib/passlock/class.rb', 'lib/passlock/version.rb']
>>>>>>> refs/remotes/origin/master
  gem.homepage      = 'https://github.com/SnazzyPine25/passlock'
  gem.license       = 'MIT'

  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'pry'

  gem.add_dependency 'ruby-hmac'
end
