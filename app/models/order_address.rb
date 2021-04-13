class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "は-(ハイフン)を含んだ半角数字で入力してください" }
    validates :prefecture_id, numericality: { other_than: 1, message: "は---以外の値にしてください" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "は10桁又は11桁の半角数字で入力してください" }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building,
                   phone_number: phone_number, order_id: order.id)
  end
end
