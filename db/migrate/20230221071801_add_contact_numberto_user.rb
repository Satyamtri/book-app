class AddContactNumbertoUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :contactnumber, :string
  end
end
