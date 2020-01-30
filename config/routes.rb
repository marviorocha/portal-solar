Rails.application.routes.draw do
  
  root to: 'power_generators#index'
  
  resources :generators, only: %i["home"] do

    get "search"
    get "advanced"
 
  end

end
