module Mutations
  module Customers
    class RegisterCustomer < BaseMutation
      field :customer, Types::UserType, null: false
      field :account, Types::CustomerAccountType, null: false
  
      argument :last_name, String, required: true
      argument :first_name, String, required: true
      argument :phone_number, String, required: true
      argument :bvn, String, required: true
      argument :bvn_token, String, required: true
      argument :reference, String, required: true
  
      def resolve(last_name:, first_name:, phone_number:, bvn:, bvn_token:, reference:)
        {  }
      end
    end
  end
end
