Rails.application.routes.draw do
  devise_for :user_authentications, controllers: {
                                                    registrations: "users/registrations",
                                                    sessions: "users/sessions"
                                                  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/hello_world', to: 'testing#hello'
end
