class CreateGlAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :gl_accounts do |t|
      t.string :name
      t.references :gl_category, null: false, foreign_key: true
      t.references :branch, null: false, foreign_key: true
      t.integer :code
      t.boolean :is_assigned
      t.money :balance
      t.boolean :is_till_account

      t.timestamps
    end
    add_index :gl_accounts, :name
  end
end
