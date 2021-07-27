require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep 0.1
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postalが空だと保存できないこと' do
        @order_address.postal = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postalが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号ハイフン（ー）抜きで入力して下さい')
      end
      it 'area_idを選択していないと保存できないこと' do
        @order_address.area_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'area_idに--が選択されていると保存できないこと' do
        @order_address.area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を選択して下さい")
      end
      it 'municipalityが空だと保存できないこと' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'addressが空だと保存できないこと' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'phoneが空だと保存できないこと' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phoneにハイフンが含まれていると保存できないこと' do
        @order_address.phone = '090-8888-8888'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号を10桁以上11桁以下で入力して下さい')
      end
      it 'phoneが全角数字だと保存できないこと' do
        @order_address.phone = '０９０８８８８８８８８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号を10桁以上11桁以下で入力して下さい')
      end
      it 'phoneが12桁以上だと保存できないこと' do
        @order_address.phone = '090456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号を10桁以上11桁以下で入力して下さい')
      end
      it 'phoneに英字が含まれていると保存できないこと' do
        @order_address.phone = '09088o88888'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号を10桁以上11桁以下で入力して下さい')
      end
      it 'tokenが空だと保存できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("カード情報を入力してください")
      end
      it 'item_idが空だと保存できないこと' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Itemを入力してください")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
