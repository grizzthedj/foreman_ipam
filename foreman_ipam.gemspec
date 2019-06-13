require File.expand_path('../lib/foreman_ipam/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'foreman_ipam'
  s.version     = ForemanIpam::VERSION
  s.license     = 'GPL-3.0'
  s.authors     = ['Christopher Smith']
  s.email       = ['chrisjsmith001@gmail.com']
  s.homepage    = 'https://github.com/grizzthedj/foreman_ipam'
  s.summary     = 'Plugin for IPAM integration with various IPAM providers'
  s.description = 'Plugin for IPAM integration with various IPAM providers'

  s.files = Dir['{app,config,db,lib,locale}/**/*'] + ['LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']
end
