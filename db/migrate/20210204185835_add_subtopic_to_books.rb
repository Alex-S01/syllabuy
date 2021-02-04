class AddSubtopicToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :subtopic, :string
  end
end
