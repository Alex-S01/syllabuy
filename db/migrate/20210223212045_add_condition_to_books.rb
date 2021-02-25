class AddConditionToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :condition, :string
  end
end
