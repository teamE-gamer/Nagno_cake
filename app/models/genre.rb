class Genre < ApplicationRecord

  has_many :items
#上記のitemとの関係って商品一個に対してジャンルが複数じゃない・・・？
end
