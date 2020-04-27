class ChangeBranchNullOnUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :branch_id, true
  end
end
