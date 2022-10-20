Rails.application.routes.draw do
  mount Reportinator::Rails::Engine => "/reportinator-rails"
end
