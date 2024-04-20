class Order < ApplicationRecord

  belongs_to :custmoer
  has_many :order_details
  
   enum payment_method: {credit_card: 0, transfer: 1}

 enum order_status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済:4}
end
