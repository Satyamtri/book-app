class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :address_id
      t.integer :user_id
      t.integer :total_price

      t.timestamps
    end
  end
end
