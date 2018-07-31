class ModifyOrderidColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :payment_responses, :order_id, :orderid
  end
end
