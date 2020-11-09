module Types
  class BranchType < Types::BaseObject
    field :name, String, null: true
    field :location, String, null: true
  end
end
