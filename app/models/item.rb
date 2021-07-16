class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :price
    validates :user
    validates :status_id
    validates :delivery_id
    validates :area_id
    validates :ship_id
  end
end
