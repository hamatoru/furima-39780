class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :price, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :token

  #バリデーションの処理を書く
  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :city
    validates :block
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    #各テーブルにデータを保存する処理を書く
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end