class CreateGlCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :gl_categories do |t|
      t.string :name
      t.integer :main_account_category
      t.text :description

      t.timestamps
    end
    add_index :gl_categories, :name
    add_index :gl_categories, :main_account_category
  end
end
