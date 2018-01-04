Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # mount Api::Check => '/api'
  mount API => '/'

  if Rails.env.development? 
    mount GrapeSwaggerRails::Engine => '/apidoc' 
  end
end
