class Item < ApplicationRecord

  has_many :cart_items
  has_many :order_details
  belongs_to :genre

  has_one_attached :image


  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :status, presence: true
  validates :genre_id, presence: true



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
