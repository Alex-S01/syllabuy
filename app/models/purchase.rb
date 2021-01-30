class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :books
  validates :payment_method, presence: true
  has_one :review, dependent: :destroy
end
