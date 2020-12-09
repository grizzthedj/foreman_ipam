Rails.application.routes.draw do
  get 'ipam', to: 'foreman_ipam/external_ipam#dashboard'
  get 'ipam/subnets', to: 'foreman_ipam/external_ipam#subnets'
end
