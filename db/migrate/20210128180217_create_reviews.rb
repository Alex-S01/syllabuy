class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :content
      t.date :creation_date
      t.references :purchases, null: false, foreign_key: true

      t.timestamps
    end
  end
end
