class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :user
  belongs_to :aera
  belongs_to :delivery
  belongs_to :ship
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :price
    validates :user
    validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :ship_id, numericality: { other_than: 1 , message: "can't be blank"}
    
  end
end
