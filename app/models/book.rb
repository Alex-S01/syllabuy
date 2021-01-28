class Book < ApplicationRecord
  validates :title, presence: true
  validates :title, presence: true
  belongs_to :user

end
