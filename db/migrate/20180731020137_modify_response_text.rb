class ModifyResponseText < ActiveRecord::Migration[5.2]
  def change
    rename_column :payment_responses, :responseText, :responsetext
  end
end
