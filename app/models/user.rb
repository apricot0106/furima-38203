class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

validates :nickname,         presence: true
validates :first_name,       presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
validates :family_name,      presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
validates :first_name_kana,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
validates :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
validates :birth_day,        presence: true

validates_format_of :password, with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

has_many :items
has_many :orders
end