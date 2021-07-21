class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal, :area_id, :municipality, :address, :building, :phone, :order, :token


  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :municipality
    validates :address
    validates :token
    validates :area_id, numericality: {other_than: 1, message: "can't be blank"} 
    validates :phone,format: {with: /\A\d{10,11}\z/, message: "is invalid"}
    validates :postal, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
  end

  def save
    @order = Order.create(user_id: user_id, item_id: item_id, )
    Address.create(postal: postal, area_id: area_id, municipality: municipality, address: address, building: building, phone: phone, @order)
  end
end