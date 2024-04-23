class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details
  
   enum payment_method: {credit_card: 0, transfer: 1}, _default: :credit_card

 enum order_status: {入金待ち:0, 入金確認:1}
end
