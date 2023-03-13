class AddColumnToPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :current_location, :integer,default: 0
  end
end
