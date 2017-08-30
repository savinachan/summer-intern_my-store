Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
		resources :stores, only: [:index, :create, :new]
	end
	resources :stores , only: [:show, :edit, :update, :destroy] do
		get :sale, to: "stores#sale"
		resources :products, only: [:index, :create, :new]
		member do
			get :assignment, to: "products#assignment"
			post :assign, to: "products#assign"
			post :unassign, to: "products#unassign"
		end
	end
	resources :products , only: [:show, :edit, :update, :destroy]

end
