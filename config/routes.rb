Rails.application.routes.draw do
  root "home#index"
  devise_for :users
  
  post "/graphql", to: "graphql#execute"
  if Rails.env.development?
    mount GraphqlPlaygroundRails::Engine, at: '/graphql/playground', graphql_path: '/graphql'
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
