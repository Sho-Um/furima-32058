class UserItemOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, length: { maximum: 11 }, numericality: { only_integer: true, message: 'is invalid. Input half-width characters.' }
  validates :token, presence: true

  def save
    user_item = UserItem.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, user_item_id: user_item.id)
  end
end
