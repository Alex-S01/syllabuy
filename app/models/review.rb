class Review < ApplicationRecord
  belongs_to :purchase

  validates :purchase_id, uniqueness: true
end
