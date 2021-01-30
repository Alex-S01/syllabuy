class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :books
  validates :payment_method, presence: true
end
