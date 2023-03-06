class ChangePincodeToIntegerInEmployees < ActiveRecord::Migration[6.1]
  def change
    change_column :employees, :pincode, :integer
  end
end
