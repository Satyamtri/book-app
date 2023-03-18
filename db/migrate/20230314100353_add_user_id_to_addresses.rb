class AddUserIdToAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :user_id, :integer
  end
end
