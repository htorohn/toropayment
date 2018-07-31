class PaymentSerializer < ActiveModel::Serializer
  attributes :id,
    :order_id,
    :ccNumber,
    :ccMonth,
    :ccYear,
    :cvv,
    :billingAddress,
    :description,
    :email,
    :amount
end
