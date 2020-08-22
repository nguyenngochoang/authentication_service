Rails.application.routes.draw do
  devise_for :user_authentications, controllers: {registrations: "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end