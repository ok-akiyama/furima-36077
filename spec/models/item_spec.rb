require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品機能' do
    context '出品できる場合' do
      it 'itemとimageがある場合は保存できること' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it 'imageがない場合は保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it 'nameがない場合は保存できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it '商品説明がない場合は保存できないこと' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end

      it 'category_idがない場合は保存できないこと' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end

      it 'category_idが1の場合は保存できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択して下さい")
      end

      it 'status_idがない場合は保存できないこと' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end

      it 'status_idが1の場合は保存できないこと' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択して下さい")
      end

      it 'delivery_idがない場合は保存できないこと' do
        @item.delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end

      it 'delivery_idが1の場合は保存できないこと' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択して下さい")
      end

      it 'area_idがない場合は保存できないこと' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end

      it 'area_idが1の場合は保存できないこと' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択して下さい")
      end

      it 'ship_idがない場合は保存できないこと' do
        @item.ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end

      it 'ship_idが1の場合は保存できないこと' do
        @item.ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択して下さい")
      end

      it 'priceがない場合は保存できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end

      it 'priceが300以下の場合は保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は300以上の値にしてください')
      end

      it 'priceが9,999,999以上の場合は保存できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は9999999以下の値にしてください')
      end

      it 'priceが全角の場合は保存できないこと' do
        @item.price = '全角'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end

      it 'priceが英字の場合は保存できないこと' do
        @item.price = 'eiji'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end

      it 'priceが英数字混合の場合は保存できないこと' do
        @item.price = '123asd'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end
    end
  end
end
