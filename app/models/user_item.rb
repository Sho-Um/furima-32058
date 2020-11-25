class UserItem < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :order

  validates :user, presence: true
end
