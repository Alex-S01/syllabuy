class AddTopicToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :topic, :string
  end
end
