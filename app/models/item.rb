class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :user
  belongs_to :area
  belongs_to :delivery
  belongs_to :ship
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :image
    validates :description
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :user
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :status_id
      validates :delivery_id
      validates :area_id
      validates :ship_id
    end
  end
end
