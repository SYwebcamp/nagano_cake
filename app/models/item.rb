class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre, foreign_key: 'genre_id'
end
