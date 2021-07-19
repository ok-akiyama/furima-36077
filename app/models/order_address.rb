class OrderAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :postal, :area_id, :municipality, :address, :building, :phone, :order

  belongs_to :user
  belongs_to :item
  has_one :address

  with_options presence: true do
    validates :user
    validates :item
    validates :municipality
    validates :address
    validates :order
    validates :area_id, numericality: {other_than: 1, message: "can't be blank"} 
    validates :phone,format: {with: /\A\d{10,11}\z/, message: "is invalid"}
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
  end

  def save
    # 寄付情報を保存し、変数donationに代入する
    order = Order.create(user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(postal: postal, area_id: area_id, municipality: municipality, address: address, building: building, phone: phone, order_id: order.id)
  end
end