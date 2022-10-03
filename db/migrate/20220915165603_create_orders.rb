class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :user
      t.string :name
      t.integer :cid
      t.integer :pid
      t.integer :quantity
      t.integer :price
      t.string :title

      t.timestamps
    end
  end
end
