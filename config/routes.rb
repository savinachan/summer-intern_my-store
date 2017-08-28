Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
		resources :stores, only: [:index, :create, :new]
	end
	resources :stores , only: [:show, :edit, :update, :destroy] do
		resources :products, only: [:index, :create, :new] do
			#member do
			#post :assign, to: "products#assign"
		#end
		end
		member do
			get :assignment, to: "products#assignment"
			post :assign, to: "products#assign"
		end
	end
	resources :products , only: [:show, :edit, :update, :destroy]

end
