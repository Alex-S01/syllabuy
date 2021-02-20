class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_one :review, dependent: :destroy

  monetize :amount_cents

end
