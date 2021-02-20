class AddColumnsToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :state, :string
    add_column :purchases, :checkout_session_id, :string
  end
end
