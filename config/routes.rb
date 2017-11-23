Rails.application.routes.draw do
  get 'doses/index'

  get 'doses/show'

  get 'doses/new'

  get 'doses/create'

  get 'doses/edit'

  get 'doses/update'

  get 'doses/destroy'

  get 'ingredients/index'

  get 'ingredients/new'

  get 'ingredients/create'

  get 'ingredients/destroy'

  get 'cocktails/index'

  get 'cocktails/show'

  get 'cocktails/new'

  get 'cocktails/create'

  get 'cocktails/edit'

  get 'cocktails/update'

  get 'cocktails/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
