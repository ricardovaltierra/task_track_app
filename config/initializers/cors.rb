Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:3000"
    resource "*", headers: :any, methods: [:get, :post, :put, :delete, :patch, :options, :head], credentials: true
    end

  allow do
    origins "http://tracking-app-api.herokuapp.com"
    resource "*", headers: :any, methods: [:get, :post, :put, :delete, :patch, :options, :head], credentials: true
  end
    
end