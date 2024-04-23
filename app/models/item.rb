class Item < ApplicationRecord

  has_many :cart_items
  has_many :order_details
  belongs_to :genre

  has_one_attached :image

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
  
  def with_tax_price
    (price * 1.1).floor
  end

  enum status: {
    "on_sale": 0,
    "off_sale": 1
  }



end
