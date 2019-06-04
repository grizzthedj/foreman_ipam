require File.expand_path('../lib/foreman_phpipam/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'foreman_phpipam'
  s.version     = ForemanPhpipam::VERSION
  s.license     = 'GPL-3.0'
  s.authors     = ['Christopher Smith']
  s.email       = ['chrisjsmith001@gmail.com']
  s.homepage    = 'https://github.com/grizzthedj'
  s.summary     = 'Plugin for IPAM integration with phpIPAM'

  # also update locale/gemspec.rb
  s.description = 'Plugin for IPAM integration with phpIPAM'

  s.files = Dir['{app,config,db,lib,locale}/**/*'] + ['LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_development_dependency 'rubocop', '~> 0'
  s.add_development_dependency 'rdoc', '~> 0'
end
