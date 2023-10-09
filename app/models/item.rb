class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  
  validates :name, presence: true
  validates :info, presence: true
  validates :category_id, numericality: { other_than: 1}
  validates :sales_status_id, numericality: { other_than: 1}
  validates :shipping_fee_status_id, numericality: { other_than: 1}
  validates :prefecture_id, numericality: { other_than: 1}
  validates :scheduled_delivery_id, numericality: { other_than: 1}
  validates :price, presence: true
end
