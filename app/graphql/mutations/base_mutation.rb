module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    field :errors, [Types::UserError], null: false

    def errors_from_record(record)
      record.errors.map do |attribute, message|
        # This is the GraphQL argument which corresponds to the validation error:
        path = ["attributes", attribute.to_s.camelize(:lower)]
        {
          path: path,
          message: message,
        }
      end
    end
  end
end
