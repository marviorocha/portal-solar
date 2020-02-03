Rails.application.routes.draw do
  
  root to: 'power_generators#index'
  
  resources :power_generators, only: [:new, :home, :create ] do

    
      collection do
        get :price_hight
        get :price_low
        get :name
        get :kwp
        get "search"
        get "advanced"
        get "consultar/:id", to: 'power_generators#consultar', as: 'consultar'
      end
    
 
  end

end
