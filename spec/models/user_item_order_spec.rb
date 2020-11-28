require 'rails_helper'

RSpec.describe UserItemOrder, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item, user_id: user.id)
      sleep 0.1
      @user_item_order = FactoryBot.build(:user_item_order, item_id: item.id, user_id: user.id)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_item_order).to be_valid
    end

    it 'postal_codeが空だと保存できないこと' do
      @user_item_order.postal_code = ""
      @user_item_order.valid?
      expect(@user_item_order.errors.full_messages).to include("Postal code can't be blank")
    end
    
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @user_item_order.postal_code = "1234567"
      @user_item_order.valid?
      expect(@user_item_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    
    it 'prefectureを選択していないと保存できないこと' do
      @user_item_order.prefecture_id = "1"
      @user_item_order.valid?
      expect(@user_item_order.errors.full_messages).to include("Prefecture can't be blank")
    end
    
    it 'cityが空だと保存できないこと' do
      @user_item_order.city = ""
      @user_item_order.valid?
      expect(@user_item_order.errors.full_messages).to include("City can't be blank")
    end
    
    it 'addressが空と保存できないこと' do
      @user_item_order.address = ""
      @user_item_order.valid?
      expect(@user_item_order.errors.full_messages).to include("Address can't be blank")
    end
    
    it 'buildingは空でも保存できること' do
      @user_item_order.building = ""
      expect(@user_item_order).to be_valid
    end
    
    it 'phone_numberが空だと保存できないこと' do
      @user_item_order.phone_number = ""
      @user_item_order.valid?
      expect(@user_item_order.errors.full_messages).to include("Phone number can't be blank")
    end
    
    it 'phone_numberにハイフンが含まれると登録できないこと' do
      @user_item_order.phone_number =  "123-456-7890"
      @user_item_order.valid?
      expect(@user_item_order.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
    end
    
    it 'tokenが空だと保存できないこと' do
      @user_item_order.token =  ""
      @user_item_order.valid?
      expect(@user_item_order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
