module Types
  class CustomerAccountType < Types::BaseObject
    field :user_id, Integer, null: true
    field :user, UserType, null: true
    field :account_name, String, null: true
    field :account_number, String, null: true
    field :branch_id, Integer, null: true
    field :balance_cents, Integer, null: true
    field :balance_currency, String, null: true
    field :account_type, Integer, null: true
    field :is_open, Boolean, null: true
    field :lien_cents, Integer, null: true
    field :lien_currency, String, null: true
    field :interest_cents, Integer, null: true
    field :interest_currency, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
  end
end
