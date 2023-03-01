class CreateSms < ActiveRecord::Migration[6.1]
  def change
    create_table :sms do |t|
      t.string :contactnumber
      t.integer :code
      
      t.timestamps
    end
  end
end
