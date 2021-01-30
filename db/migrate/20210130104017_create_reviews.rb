class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :content
      t.references :purchase, null: false, foreign_key: true

      t.timestamps
    end
  end
end
