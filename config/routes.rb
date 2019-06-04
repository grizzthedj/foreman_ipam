Rails.application.routes.draw do
  get 'phpipam', to: 'foreman_phpipam/dashboard#phpipam'
  get 'phpipam/subnets', to: 'foreman_phpipam/dashboard#subnets'
end
