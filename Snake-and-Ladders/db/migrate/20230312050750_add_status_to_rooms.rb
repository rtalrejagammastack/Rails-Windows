class AddStatusToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :status, :string
  end
end
