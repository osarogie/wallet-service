module Types
  class UserType < Types::BaseObject
    field :email, String, null: true
    field :unconfirmed_email, String, null: true
    field :locked_at, GraphQL::Types::ISO8601DateTime, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :username, String, null: true
    field :full_name, String, null: true
    field :phone_number, String, null: true
    field :branch_id, Bignum, null: true
    field :level, Integer, null: true
  end
end
