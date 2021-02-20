class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string :payment_method
      t.date :purchase_date_time
      t.date :closing_date_time
      t.references :user, null: false, foreign_key: true
      t.references :books, null: false, foreign_key: true
      t.monetize :amount, currency: { present: false }

      t.timestamps
    end
  end
end
