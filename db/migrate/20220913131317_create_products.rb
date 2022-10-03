class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :des
      t.integer :qty
      t.references :Catageroy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
