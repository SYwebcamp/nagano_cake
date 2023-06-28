class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre, foreign_key: 'genre_id'
  has_many :cart_items
  has_many :order_details
  def add_tax_price
    (self.price * 1.10).round
  end

  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :genre, presence: true
  validates :price, presence: true
  validates :is_active, presence: true
end
