class CreatePostPets < ActiveRecord::Migration[6.1]
  def change
    create_table :post_pets do |t|
      t.bigint :pet_id, null: false
      t.bigint :post_id, null: false

      t.timestamps
    end

    add_foreign_key :post_pets, :pets, column: :pet_id
    add_foreign_key :post_pets, :posts, column: :post_id
  end
end
