class AddAdditionalAttrToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :date_of_joining, :date
    add_column :employees, :bio, :text
  end
end
