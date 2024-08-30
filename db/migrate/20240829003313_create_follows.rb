class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.bigint :following_user_id, null: false
      t.bigint :followed_user_id, null: false

      t.timestamps
    end

    add_foreign_key :follows, :users, column: :following_user_id
    add_foreign_key :follows, :users, column: :followed_user_id
  end
end
