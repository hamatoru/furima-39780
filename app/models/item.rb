class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :sale_status
    belongs_to :shipping_status
    belongs_to :prefecture
    belongs_to :scheduled_delivery

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_info
    validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :sale_status_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :shipping_status_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :scheduled_delivery_id, numericality: { other_than: 1, message: "can't be blank"}

    validates :price, numericality:{only_integer:true,greater_than_or_equal_to:300,less_than_or_equal_to:9999999},numericality: { with: /\A[0-9]+\z/, message:"Input half-width characters" }
    end

end
