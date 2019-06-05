Rails.application.routes.draw do
  get 'ipam', to: 'foreman_ipam/dashboard#ipam'
  get 'ipam/phpipam/subnets', to: 'foreman_ipam/dashboard#subnets'
end
