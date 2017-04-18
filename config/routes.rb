Rails.application.routes.draw do
  resources :ds18b20s, only: [:new, :create, :show, :edit, :update]
end
