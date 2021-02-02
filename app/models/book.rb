class Book < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :edition_year, presence: true
  validates :author, presence: true
  belongs_to :user
  has_one :purchase
end
