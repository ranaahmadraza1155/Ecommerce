class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.string :user
      t.integer :cid
      t.integer :pid
      t.string :title
      t.integer :quantity
      t.integer :aqty
      t.decimal :price

      t.timestamps
    end
  end
end
