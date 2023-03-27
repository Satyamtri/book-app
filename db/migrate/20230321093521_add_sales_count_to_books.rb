class AddSalesCountToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :sale_count, :integer, null: false, default: 0
  end
end
