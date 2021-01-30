class Book < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :edition_year, presence: true
  belongs_to :user
end
