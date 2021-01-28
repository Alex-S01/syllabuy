class CreateReviews < ActiveRecord::Migration[6.0]
  def change
     create_table :purchases do |t|
      t.string :payment_method
      t.date :purchase_date_time
      t.date :closing_date_time
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    create_table :reviews do |t|
      t.integer :rating
      t.string :content
      t.date :creation_date
      t.references :purchases, null: false, foreign_key: true

      t.timestamps
    end
  end
end
