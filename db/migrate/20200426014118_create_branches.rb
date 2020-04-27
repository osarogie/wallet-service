class CreateBranches < ActiveRecord::Migration[6.0]
  def change
    create_table :branches do |t|
      t.string :name
      t.text :location

      t.timestamps
    end
    add_index :branches, :name
  end
end
