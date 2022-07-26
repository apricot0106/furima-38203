class Item < ApplicationRecord
  validates :image,              presence: true
  validates :name,               presence: true
  validates :description,        presence: true
  validates :category_id,        numericality: { other_than: 0, message: "can't be blank" }
  validates :condition_id,       numericality: { other_than: 0, message: "can't be blank" }
  validates :shipping_charge_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :ship_from_id,       numericality: { other_than: 0, message: "can't be blank" }
  validates :preparation_day_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :price,              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to :user
  # has_one :basket
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :ship_from
  belongs_to :preparation_day
end