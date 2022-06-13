Rails.application.routes.draw do
  root to: 'recipes#index'
  resources :recipes do
    resources :recipe_and_material_records, only: %i[index new create destroy], shallow: true
  end
  resources :materials
  devise_for :users
end
