class Book < ApplicationRecord
  validates :title, presence: true
  validates :edition_year, presence: true
  validates :author, presence: true
  belongs_to :user
  has_one :purchase
  has_one_attached :photo
  geocoded_by :selling_address
  after_validation :geocode, if: :will_save_change_to_selling_address?

  monetize :correct_price_cents
end



