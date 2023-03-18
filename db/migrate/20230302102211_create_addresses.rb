class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :contactnumber
      t.integer :pincode
      t.string :city
      t.string :state
      t.string :country
      t.string :landmark

      t.timestamps
    end
  end
end
