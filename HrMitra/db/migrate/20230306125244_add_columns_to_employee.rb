class AddColumnsToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :dob, :datetime
    add_column :employees, :age, :integer
  end
end
