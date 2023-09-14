class Item < ApplicationRecord

  with_options presence: true do
    validates :item_name
    validates :price
    validates :item_info
    validates :category_id
    validates :sale_status_id
    validates :shipping_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
    validates :image
    end

    belongs_to :user

end

#TODO:バリデーション参考（要：確認）
