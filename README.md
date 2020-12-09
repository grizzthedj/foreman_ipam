# foreman_ipam

Foreman plugin for IPAM integration with External IPAM providers. Provides a basic Dashboard for viewing External IPAM groups and subnets via External IPAM Smart Proxy API's. 

## Installation

See [How_to_Install_a_Plugin](http://projects.theforeman.org/projects/foreman/wiki/How_to_Install_a_Plugin)
for how to install Foreman plugins.

## Usage

Once plugin is installed, you can look at the External IPAM Dashboard at Infrastructure --> External IPAM, for a simple view of groups and subnets. 

## Local development

1. Clone the Foreman repo 
```
git clone https://github.com/theforeman/foreman.git
```
2. Clone the Smart Proxy repo
```
git clone https://github.com/theforeman/smart-proxy
```
3. Fork both the foreman plugin and smart proxy plugin repos, then clone

foreman_ipam repo: https://github.com/grizzthedj/foreman_ipam  
smart_proxy_ipam repo: https://github.com/grizzthedj/smart_proxy_ipam

```
git clone https://github.com/<GITHUB_USER>/foreman_ipam
git clone https://github.com/<GITHUB_USER>/smart_proxy_ipam
```
4. Add the foreman_ipam plugin to `Gemfile.local.rb` in the Foreman bundler.d directory
```
gem 'foreman_ipam', :path => '/path/to/foreman_ipam'
```
5. From Foreman root directory run 
```
bundle install
bundle exec rails db:migrate
bundle exec rails db:seed
bundle exec foreman start
```
6. Add the smart_proxy_ipam plugin to `Gemfile.local.rb` in Smart Proxy bundler.d directory
```
gem 'smart_proxy_ipam', :path => '/path/to/smart_proxy_ipam'
```

7. Copy `config/settings.d/externalipam.yml.example` to `config/settings.d/externalipam.yml`, and set `enabled` to true, and `use_provider` to `externalipam_phpipam` or `externalipam_netbox`.

8. Copy `config/settings.d/externalipam_phpipam.yml.example` to `config/settings.d/externalipam_phpipam.yml` and replace values with your phpIPAM URL and credentials.

9. Copy `config/settings.d/externalipam_netbox.yml.example` to `config/settings.d/externalipam_netbox.yml` and replace values with your Netbox URL and API token.

10. From Smart Proxy root directory run ... 
```
bundle install
bundle exec smart-proxy start
```
11. Navigate to Foreman UI at http://localhost:5000
12. Add a Local Smart Proxy in the Foreman UI(Infrastructure => Smart Proxies)
13. Ensure that the `External IPAM` feature is present on the proxy(http://proxy_url/features)
14. Create a Subnet, and associate the subnet to the `External IPAM` proxy

## Run tests

From the Foreman core, run ...

```
bundle exec rails test:foreman_ipam
```

## Contributing

Fork and send a Pull Request. Thanks!

## Copyright

Copyright (c) *2019* *Christopher Smith*

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
