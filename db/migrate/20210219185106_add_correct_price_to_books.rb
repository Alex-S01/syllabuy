class AddCorrectPriceToBooks < ActiveRecord::Migration[6.0]
  def change
    add_monetize :books, :correct_price, currency: { present: false }
  end
end
