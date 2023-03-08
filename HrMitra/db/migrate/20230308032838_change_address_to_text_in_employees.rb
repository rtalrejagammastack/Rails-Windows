class ChangeAddressToTextInEmployees < ActiveRecord::Migration[6.1]
  def change
    change_column :employees,:address,:text
  end
end
