module Types
  class MutationType < Types::BaseObject
    field :register_customer, mutation: Mutations::Customers::RegisterCustomer
  end
end
