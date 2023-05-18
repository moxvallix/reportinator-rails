Reportinator::Rails::Engine.routes.draw do
  resources :reports

  root to: "reports#index"
  
  get "/download", to: "reports#download"
  get "/*id", to: "reports#show"
end
