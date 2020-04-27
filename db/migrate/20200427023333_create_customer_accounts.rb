class CreateCustomerAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :account_name
      t.string :account_number
      t.references :branch, null: true, foreign_key: true
      t.money :balance
      t.integer :account_type
      t.boolean :is_open
      t.money :lein
      t.money :interest

      t.timestamps
    end
    add_index :customer_accounts, :account_name
    add_index :customer_accounts, :account_number
  end
end
