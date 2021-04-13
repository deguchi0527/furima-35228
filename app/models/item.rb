class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  validates :image, :name, :info, presence: true

  with_options presence: true, numericality: { other_than: 1, message: "は---以外の値にしてください" } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  validates :price, presence: true, inclusion: { in: (300..9_999_999), message: "は¥300~¥9,999,999以下で入力してください" }
  validates :price, numericality: { with: /\A[0-9]+\z/, message: "は半角数字で入力してください" }
  
end
