class CreateFriend < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.integer :proposer
      t.integer :recipient
    end
    add_foreign_key :friends, :users, column: :proposer
    add_foreign_key :friends, :users, column: :recipient
  end
end
