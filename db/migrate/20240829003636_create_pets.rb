class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name, null: false
      t.string :temper, null: false
      t.string :weight
      t.date :birthday
      t.string :species, null: false
      t.bigint :user_id, null: false

      t.timestamps
    end

    add_foreign_key :pets, :users
  end
end
