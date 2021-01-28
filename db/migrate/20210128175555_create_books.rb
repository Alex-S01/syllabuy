class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :summary
      t.integer :pages
      t.integer :price
      t.integer :edition_year
      t.string :ISBN
      t.string :language
      t.string :publisher
      t.boolean :status
      t.string :delivery_method
      t.string :selling_address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
