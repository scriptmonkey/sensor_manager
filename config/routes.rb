Rails.application.routes.draw do
  resource :ds18b20s, only: [:new, :create]
end
