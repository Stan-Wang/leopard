if Rails.env.development? 
  GrapeSwaggerRails.options.url = "swagger_doc" 
  GrapeSwaggerRails.options.app_name = 'Leopard' 
  GrapeSwaggerRails.options.app_url = '/api/' 
end