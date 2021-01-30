class Book < ApplicationRecord
  validates :title, presence: true
  validates :title, presence: true
  belongs_to :user
  belongs_to :purchases
end
