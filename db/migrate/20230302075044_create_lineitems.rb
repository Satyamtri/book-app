class CreateLineitems < ActiveRecord::Migration[6.1]
  def change
    create_table :lineitems do |t|
      t.integer :book_id
      t.integer :order_id
      t.integer :price
      t.integer :quantity
      t.integer :total_price

      t.timestamps
    end
  end
end
