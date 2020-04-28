class CreateGlPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :gl_posts do |t|
      t.references :gl_account_to_credit, null: false, foreign_key: { to_table: :gl_accounts }
      t.references :gl_account_to_debit, null: false, foreign_key: { to_table: :gl_accounts }
      t.monetize :amount
      t.text :narration
      t.references :user, null: false, foreign_key: true
      t.timestamp :posted_at

      t.timestamps
    end
  end
end
