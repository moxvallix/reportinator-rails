Reportinator::Rails::Engine.routes.draw do
  resources :reports

  root to: "reports#index"

  put "/*id", to: "reports#update", as: "report_update"
  get "/*id", to: "reports#show"
end
