class ChangeAddressToTextInEmployees < ActiveRecord::Migration[6.1]
  def up
    change_column :employees,:address,:text
  end
  def down
    change_column :employees,:address,:string
  end
end
