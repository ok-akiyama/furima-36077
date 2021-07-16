class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :nickname,   presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_read, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name,  presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_read,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday,   presence: true
end
