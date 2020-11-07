Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ["https://steptracking.netlify.app/", "http://localhost:3000"]
    resource "*", 
    headers: :any, methods: [:get, :post, :put, :delete, :patch, :options, :head], 
    credentials: true
  end
   
  
end