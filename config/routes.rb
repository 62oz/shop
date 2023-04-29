Rails.application.routes.draw do
  resources :cart, only: [:index, :show, :destroy] do
    collection do
      delete 'empty'
    end
    resources :line_items, only: [:show, :create, :update, :destroy], shallow: true
    delete 'line_items/:id' => 'line_items#destroy', as: :line_item
  end

  resources :products
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  root 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
