Rails.application.routes.draw do
  devise_for :users
  
  if Rails.env.development?
    mount GraphqlPlaygroundRails::Engine, at: '/graphql/playground', graphql_path: '/graphql'
  end
end
