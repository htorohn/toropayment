class CreatePaymentResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_responses do |t|
      t.string :order_id
      t.string :response
      t.string :responseText
      t.string :authCode
      t.string :transactionID
      t.string :avsResponse
      t.string :cvvResponse
      t.string :transactionType
      t.string :responseCode

      t.timestamps
    end
  end
end
