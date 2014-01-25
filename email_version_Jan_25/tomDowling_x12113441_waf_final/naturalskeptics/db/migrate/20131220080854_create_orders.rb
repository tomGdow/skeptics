class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :firstname
      t.string :lastname
      t.text :address
      t.string :email
      t.string :confirm_email
      t.integer :card_number
      t.string :card_type

      t.timestamps
    end
  end
end
