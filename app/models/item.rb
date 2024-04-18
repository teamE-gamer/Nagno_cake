class Item < ApplicationRecord

  has_many :cart_items
  has_many :order_details
  belongs_to :genres
 #上記のgenresとの関係って商品一個に対してジャンルが複数じゃない・・・？
  has_one_attached :image


  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end

end
