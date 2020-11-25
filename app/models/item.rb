class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :user_item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  validates :name, :info, :user_id, :image, presence: true

  VALID_PRICEL_HALF = /\A[0-9]+\z/.freeze

  validates :price, presence: true, format: { with: VALID_PRICEL_HALF }, length: { minimum: 3, maxinum: 7 }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than: 10_000_000 }

  validates :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 1 }
end
