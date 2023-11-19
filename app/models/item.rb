class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image, dependent: :destroy
  has_many_attached :images_sub, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  validates :image, presence: true, blob: { content_type: :image }  # gem 'activestorage-validator'を導入した
  validates :images_sub, length: { maximum: 5, message: "は5枚以下にして下さい" }
  validates :name, presence: true
  validates :info, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, message: 'is invalid. Input integer value in half-width characters' }
  validates :price, numericality: { in: 300..9_999_999, message: 'is out of setting range' }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :sales_status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :scheduled_delivery_id, numericality: { other_than: 1, message: "can't be blank" }
end
