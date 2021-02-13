class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_one :review, dependent: :destroy

  validates :payment_method, presence: true

end
