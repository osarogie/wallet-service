module Types
  class QueryType < Types::BaseObject
    field :banks, [String], null: false, description: "Get Banks for a specific country" do
      argument :country_code, String, required: true, description: "Country code"
    end

    def banks(country_code:)
      [country_code]
    end

    field :branches, BranchType.connection_type, null: false, description: "Get branches" do
      argument :country_code, String, required: true, description: "Country code"
    end

    def branches
      Branch.all
    end

    field :customer_accounts, CustomerAccountType.connection_type, null: false, description: "Get account" do
      argument :field_type, CustomerAccountFieldType, required: true, description: "Field"
      argument :value, String, required: true, description: "Value"
    end

    def customer_accounts(field_type:, value:)
      CustomerAccount.all
    end
  end
end
