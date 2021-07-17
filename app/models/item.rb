class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :user
  belongs_to :area
  belongs_to :delivery
  belongs_to :ship
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :image
    validates :description
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :price, numericality: { greater_than_or_equal_to: 300 }
    validates :price, numericality: { less_than_or_equal_to: 9_999_999 }
    validates :user
    validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :delivery_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :ship_id, numericality: { other_than: 1, message: "can't be blank" }
  end
end
