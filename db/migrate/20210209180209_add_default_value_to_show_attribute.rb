class AddDefaultValueToShowAttribute < ActiveRecord::Migration[6.0]
  def change
    change_column :books, :status, :boolean, default: false
  end
end
