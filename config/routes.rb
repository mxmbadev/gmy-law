Rails.application.routes.draw do

  devise_for :users
  root 'welcome#index'
  resources :posts, path: :news
  get 'welcome/about' => 'welcome#about', :path => 'about'
  get 'welcome/work' => 'welcome#work', :path => 'work'

  get '*path' => redirect('/')

end
