class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.bigint :post_id, null: false
      t.bigint :user_id, null: false

      t.timestamps
    end
    add_foreign_key :comments, :posts, column: :post_id
    add_foreign_key :comments, :users, column: :user_id
  end
end
