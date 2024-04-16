class Order < ApplicationRecord

  belongs_to :custmoer
  has_many :order_details

end
