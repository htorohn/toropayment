class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :order_id, null: false
      t.string :ccNumber, null: false
      t.string :ccMonth, null: false
      t.string :ccYear, null: false
      t.string :cvv, null: false
      t.string :billingAddress
      t.string :description
      t.string :email
      t.float :amount, null: false

      t.timestamps
    end
  end
end
