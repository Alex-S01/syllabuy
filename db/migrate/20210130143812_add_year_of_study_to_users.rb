class AddYearOfStudyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :year_of_study, :integer
  end
end
