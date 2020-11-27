FactoryBot.define do
  factory :user_item_order do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '沖縄県 '}
    address { '3-3' }
    building { 'セント' }
    phone_number { '12345678910' }

  end
end
