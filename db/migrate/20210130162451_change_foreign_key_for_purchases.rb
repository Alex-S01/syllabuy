class ChangeForeignKeyForPurchases < ActiveRecord::Migration[6.0]
  def change
    rename_column :purchases, :books_id, :book_id
  end
end
