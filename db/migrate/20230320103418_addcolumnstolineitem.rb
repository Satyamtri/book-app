class Addcolumnstolineitem < ActiveRecord::Migration[6.1]
  def change
    add_column :lineitems, :purchase_type, :string
    add_column :lineitems, :time_period, :integer
  end
end
