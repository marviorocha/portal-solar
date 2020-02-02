Rails.application.routes.draw do
  
  root to: 'power_generators#index'
  
  resources :power_generators, only: [:new, :home, :create ] do

    
      collection do
        get :price_hight
        get :price_low
        get :name
        get "search"
        get "advanced"
      end
    
 
  end

end
