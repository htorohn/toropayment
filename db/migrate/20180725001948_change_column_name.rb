class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :payment_responses, :responseText, :responseText
    rename_column :payment_responses, :authCode, :authcode
    rename_column :payment_responses, :transactionID, :transactionid
    rename_column :payment_responses, :avsResponse, :avsresponse
    rename_column :payment_responses, :cvvResponse, :cvvresponse
    rename_column :payment_responses, :transactionType, :type
    rename_column :payment_responses, :responseCode, :response_code
  end
end
