Rails.application.routes.draw do
  get 'dashboards/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'dashboards#index'
  namespace 'api' do
    namespace 'v1' do
      resources :notebooks, :path => 'books'
    end
  end
  get '/api/v1/external-books' => 'api/v1/notebooks#external_books'
  post '/api/v1/books/:id/delete', to: 'api/v1/notebooks#destroy'
  post '/api/v1/books/:id/update', to: 'api/v1/notebooks#update'
end
