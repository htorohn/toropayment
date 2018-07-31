Rails.application.routes.draw do
  
  #Rutas para acceder al API
  #scope '/api' do
  namespace :api do
    namespace :v1 do
      resources :payments
      # resources :events do
      #   collection do
      #     get 'upcoming'
      #     post 'image_upload/:id', to: 'events#image_upload'
      #   end
      # end
    end
  end
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
