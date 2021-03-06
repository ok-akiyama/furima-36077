class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal, :area_id, :municipality, :address, :building, :phone, :order, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :municipality
    validates :address
    validates :token
    validates :area_id, numericality: { other_than: 1, message: "を選択して下さい" }
    validates :phone, format: { with: /\A\d{10,11}\z/, message: 'を10桁以上11桁以下で入力して下さい' }
    validates :postal, format: { with: /\A\d{3}-\d{4}\z/, message: 'ハイフン（ー）抜きで入力して下さい' }
  end

  def save
    @order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal: postal, area_id: area_id, municipality: municipality, address: address, building: building,
                   phone: phone, order_id: @order.id)
  end
end
