class PaymentResponseSerializer < ActiveModel::Serializer
  attributes :id, 
    :orderid, 
    :response, 
    :responsetext, 
    :authcode, 
    :transactionid, 
    :avsresponse, 
    :cvvresponse, 
    :type, 
    :responsecode
end
