class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item
  
  
  enum making_status: {着手不可: 0, 製作中: 1, 発送準備中: 2, 発送済: 3},_default: :着手不可
end
